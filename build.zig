const std = @import("std");
const builtin = @import("builtin");

const Build = std.Build;
const OptimizeMode = std.builtin.OptimizeMode;
const ResolvedTarget = std.Build.ResolvedTarget;

pub fn build(b: *Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const examples: [8]exampleBuildConfig = .{ .{
        .name = "in-out",
        .path = "src/1-5-shaders/1-in-out.zig",
    }, .{
        .name = "uniforms",
        .path = "src/1-5-shaders/2-uniforms.zig",
    }, .{
        .name = "attributes",
        .path = "src/1-5-shaders/3-attributes.zig",
    }, .{
        .name = "triangle",
        .path = "src/triangle.zig",
    }, .{
        .name = "hello",
        .path = "src/hello.zig",
    }, .{
        .name = "texture",
        .path = "src/1-6-textures/1-texture.zig",
    }, .{
        .name = "texture-blend",
        .path = "src/1-6-textures/2-texture-blend.zig",
    }, .{
        .name = "multiple-textures",
        .path = "src/1-6-textures/3-multiple-textures.zig",
    } };

    inline for (examples) |example| {
        try buildExample(b, example, target, optimize);
    }
}

const exampleBuildConfig = struct {
    name: []const u8,
    path: []const u8,
};

fn buildExample(b: *Build, comptime conf: exampleBuildConfig, target: ResolvedTarget, optimize: OptimizeMode) !void {
    var run: ?*Build.Step.Run = null;
    const emsdk = b.dependency("emsdk", .{});
    const dep_sokol = b.dependency("sokol", .{
        .target = target,
        .optimize = optimize,
    });
    if (!target.result.isWasm()) {
        const example = b.addExecutable(.{
            .name = conf.name,
            .target = target,
            .optimize = optimize,
            .root_source_file = b.path(conf.path),
        });
        example.linkLibC();
        example.addCSourceFile(.{
            .file = .{
                .path = "src/stb_image.c",
            },
        });
        example.addIncludePath(.{
            .path = "src/",
        });
        example.root_module.addImport("sokol", dep_sokol.module("sokol"));
        b.installArtifact(example);
        run = b.addRunArtifact(example);
    } else {
        // for WASM, need to build the Zig code as static library, since linking happens via emcc
        const example = b.addStaticLibrary(.{
            .name = conf.name,
            .root_source_file = b.path(conf.path),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        });
        //example.linkLibC();
        //example.addIncludePath(.{
        //    .path = "src/",
        //});

        //example.addCSourceFile(.{
        //    .file = .{
        //        .path = "src/stb_image.c",
        //    },
        //});
        example.root_module.addImport("sokol", dep_sokol.module("sokol"));

        const backend = resolveSokolBackend(target.result);
        const link_step = try emLinkStep(b, .{
            .lib_main = example,
            .target = target,
            .optimize = optimize,
            .emsdk = emsdk,
            .use_webgpu = backend == .wgpu,
            .use_webgl2 = backend != .wgpu,
            .use_emmalloc = true,
            .use_filesystem = false,
            // NOTE: when sokol-zig is used as package, this path needs to be absolute!
            //.shell_file_path = "src/emscripten/shell.html",
        });
        // ...and a special run step to run the build result via emrun
        run = emRunStep(b, .{ .name = conf.name, .emsdk = emsdk });
        run.?.step.dependOn(&link_step.step);
    }
    b.step("run-" ++ conf.name, "run " ++ conf.name).dependOn(&run.?.step);
}

// emscripten stuff pulled from build.zig of zig-sokol

pub const SokolBackend = enum {
    d3d11,
    metal,
    gl,
    gles3,
    wgpu,
};

// helper function to resolve .auto backend based on target platform
pub fn resolveSokolBackend(target: std.Target) SokolBackend {
    if (target.isDarwin()) {
        return .metal;
    } else if (target.os.tag == .windows) {
        return .d3d11;
    } else if (target.isWasm()) {
        return .gles3;
    } else if (target.isAndroid()) {
        return .gles3;
    } else {
        return .gl;
    }
}

// for wasm32-emscripten, need to run the Emscripten linker from the Emscripten SDK
// NOTE: ideally this would go into a separate emsdk-zig package
pub const EmLinkOptions = struct {
    target: Build.ResolvedTarget,
    optimize: OptimizeMode,
    lib_main: *Build.Step.Compile, // the actual Zig code must be compiled to a static link library
    emsdk: *Build.Dependency,
    release_use_closure: bool = true,
    release_use_lto: bool = true,
    use_webgpu: bool = false,
    use_webgl2: bool = false,
    use_emmalloc: bool = false,
    use_filesystem: bool = true,
    // FIXME: this should be a LazyPath?
    shell_file_path: ?[]const u8 = null,
    extra_args: []const []const u8 = &.{},
};
pub fn emLinkStep(b: *Build, options: EmLinkOptions) !*Build.Step.Run {
    const emcc_path = b.findProgram(&.{"emcc"}, &.{}) catch b.pathJoin(&.{ emSdkPath(b, options.emsdk), "upstream", "emscripten", "emcc" });
    // create a separate output directory zig-out/web
    try std.fs.cwd().makePath(b.fmt("{s}/web", .{b.install_path}));

    var emcc_cmd = std.ArrayList([]const u8).init(b.allocator);
    defer emcc_cmd.deinit();

    try emcc_cmd.append(emcc_path);
    if (options.optimize == .Debug) {
        try emcc_cmd.append("-Og");
        try emcc_cmd.append("-sSAFE_HEAP=1");
        try emcc_cmd.append("-sSTACK_OVERFLOW_CHECK=1");
    } else {
        try emcc_cmd.append("-sASSERTIONS=0");
        if (options.optimize == .ReleaseSmall) {
            try emcc_cmd.append("-Oz");
        } else {
            try emcc_cmd.append("-O3");
        }
        if (options.release_use_lto) {
            try emcc_cmd.append("-flto");
        }
        if (options.release_use_closure) {
            try emcc_cmd.append("--closure");
            try emcc_cmd.append("1");
        }
    }
    if (options.use_webgpu) {
        try emcc_cmd.append("-sUSE_WEBGPU=1");
    }
    if (options.use_webgl2) {
        try emcc_cmd.append("-sUSE_WEBGL2=1");
    }
    if (!options.use_filesystem) {
        try emcc_cmd.append("-sNO_FILESYSTEM=1");
    }
    if (options.use_emmalloc) {
        try emcc_cmd.append("-sMALLOC='emmalloc'");
    }
    if (options.shell_file_path) |shell_file_path| {
        try emcc_cmd.append(b.fmt("--shell-file={s}", .{shell_file_path}));
    }
    try emcc_cmd.append(b.fmt("-o{s}/web/{s}.html", .{ b.install_path, options.lib_main.name }));
    for (options.extra_args) |arg| {
        try emcc_cmd.append(arg);
    }

    const emcc = b.addSystemCommand(emcc_cmd.items);
    emcc.setName("emcc"); // hide emcc path

    // add the main lib, and then scan for library dependencies and add those too
    emcc.addArtifactArg(options.lib_main);
    var it = options.lib_main.root_module.iterateDependencies(options.lib_main, false);
    while (it.next()) |item| {
        for (item.module.link_objects.items) |link_object| {
            switch (link_object) {
                .other_step => |compile_step| {
                    switch (compile_step.kind) {
                        .lib => {
                            emcc.addArtifactArg(compile_step);
                        },
                        else => {},
                    }
                },
                else => {},
            }
        }
    }

    // get the emcc step to run on 'zig build'
    b.getInstallStep().dependOn(&emcc.step);
    return emcc;
}

// build a run step which uses the emsdk emrun command to run a build target in the browser
// NOTE: ideally this would go into a separate emsdk-zig package
pub const EmRunOptions = struct {
    name: []const u8,
    emsdk: *Build.Dependency,
};
pub fn emRunStep(b: *Build, options: EmRunOptions) *Build.Step.Run {
    const emrun_path = b.findProgram(&.{"emrun"}, &.{}) catch b.pathJoin(&.{ emSdkPath(b, options.emsdk), "upstream", "emscripten", "emrun" });
    const emrun = b.addSystemCommand(&.{ emrun_path, b.fmt("{s}/web/{s}.html", .{ b.install_path, options.name }) });
    return emrun;
}

// helper function to extract emsdk path from the emsdk package dependency
fn emSdkPath(b: *Build, emsdk: *Build.Dependency) []const u8 {
    return emsdk.path("").getPath(b);
}

// One-time setup of the Emscripten SDK (runs 'emsdk install + activate'). If the
// SDK had to be setup, a run step will be returned which should be added
// as dependency to the sokol library (since this needs the emsdk in place),
// if the emsdk was already setup, null will be returned.
// NOTE: ideally this would go into a separate emsdk-zig package
fn emSdkSetupStep(b: *Build, emsdk: *Build.Dependency) !?*Build.Step.Run {
    const emsdk_path = emSdkPath(b, emsdk);
    const dot_emsc_path = b.pathJoin(&.{ emsdk_path, ".emscripten" });
    const dot_emsc_exists = !std.meta.isError(std.fs.accessAbsolute(dot_emsc_path, .{}));
    if (!dot_emsc_exists) {
        var cmd = std.ArrayList([]const u8).init(b.allocator);
        defer cmd.deinit();
        if (builtin.os.tag == .windows)
            try cmd.append(b.pathJoin(&.{ emsdk_path, "emsdk.bat" }))
        else {
            try cmd.append("bash"); // or try chmod
            try cmd.append(b.pathJoin(&.{ emsdk_path, "emsdk" }));
        }
        const emsdk_install = b.addSystemCommand(cmd.items);
        emsdk_install.addArgs(&.{ "install", "latest" });
        const emsdk_activate = b.addSystemCommand(cmd.items);
        emsdk_activate.addArgs(&.{ "activate", "latest" });
        emsdk_activate.step.dependOn(&emsdk_install.step);
        return emsdk_activate;
    } else {
        return null;
    }
}
