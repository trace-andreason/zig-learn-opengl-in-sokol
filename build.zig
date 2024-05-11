const std = @import("std");
const builtin = @import("builtin");
const sokol = @import("sokol");

const Build = std.Build;
const OptimizeMode = std.builtin.OptimizeMode;
const ResolvedTarget = std.Build.ResolvedTarget;

pub fn build(b: *Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const examples: [13]exampleBuildConfig = .{
        .{
            .name = "in-out",
            .path = "src/1-5-shaders/1-in-out.zig",
        },
        .{
            .name = "uniforms",
            .path = "src/1-5-shaders/2-uniforms.zig",
        },
        .{
            .name = "attributes",
            .path = "src/1-5-shaders/3-attributes.zig",
        },
        .{
            .name = "triangle",
            .path = "src/triangle.zig",
        },
        .{
            .name = "hello",
            .path = "src/hello.zig",
        },
        .{
            .name = "texture",
            .path = "src/1-6-textures/1-texture.zig",
        },
        .{
            .name = "texture-blend",
            .path = "src/1-6-textures/2-texture-blend.zig",
        },
        .{
            .name = "multiple-textures",
            .path = "src/1-6-textures/3-multiple-textures.zig",
        },
        .{
            .name = "scale-rotate",
            .path = "src/1-7-transformations/1-scale-rotate.zig",
        },
        .{
            .name = "rotate-translate",
            .path = "src/1-7-transformations/2-rotate-translate.zig",
        },
        .{
            .name = "coordinate-plane",
            .path = "src/1-8-coordinate-systems/1-plane.zig",
        },
        .{
            .name = "coordinate-cube",
            .path = "src/1-8-coordinate-systems/2-cube.zig",
        },
        .{
            .name = "coordinate-more-cubes",
            .path = "src/1-8-coordinate-systems/3-more-cubes.zig",
        },
    };

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
    const dep_sokol = b.dependency("sokol", .{
        .target = target,
        .optimize = optimize,
    });
    const dep_zalgebra = b.dependency("zalgebra", .{ .target = target, .optimize = optimize });
    if (!target.result.isWasm()) {
        const example = b.addExecutable(.{
            .name = conf.name,
            .target = target,
            .optimize = optimize,
            .root_source_file = b.path(conf.path),
        });
        example.linkLibC();
        example.addIncludePath(.{
            .path = "src/",
        });
        example.addCSourceFile(.{
            .file = .{
                .path = "src/stb_image.c",
            },
        });
        example.root_module.addImport("sokol", dep_sokol.module("sokol"));
        example.root_module.addImport("zalgebra", dep_zalgebra.module("zalgebra"));
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
        example.addIncludePath(.{
            .path = "src/",
        });

        example.addCSourceFile(.{
            .file = .{
                .path = "src/stb_image.c",
            },
        });
        const emsdk = dep_sokol.builder.dependency("emsdk", .{});
        const emsdk_path = emsdk.path("").getPath(b);
        const emsdk_sysroot = b.pathJoin(&.{ emsdk_path, "upstream", "emscripten", "cache", "sysroot" });
        const include_path = b.pathJoin(&.{ emsdk_sysroot, "include" });
        example.addSystemIncludePath(.{ .path = include_path });

        example.root_module.addImport("sokol", dep_sokol.module("sokol"));
        example.root_module.addImport("zalgebra", dep_zalgebra.module("zalgebra"));

        const link_step = try sokol.emLinkStep(b, .{
            .lib_main = example,
            .target = target,
            .optimize = optimize,
            .emsdk = emsdk,
            .use_webgl2 = true,
            .use_emmalloc = true,
            .use_filesystem = false,
            .shell_file_path = dep_sokol.path("src/sokol/web/shell.html").getPath(b),
            .extra_args = &.{"-sUSE_OFFSET_CONVERTER=1"},
        });
        run = sokol.emRunStep(b, .{ .name = conf.name, .emsdk = emsdk });
        run.?.step.dependOn(&link_step.step);
    }
    b.step("run-" ++ conf.name, "run " ++ conf.name).dependOn(&run.?.step);
}
