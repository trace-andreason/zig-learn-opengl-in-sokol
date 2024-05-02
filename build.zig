const std = @import("std");

const Build = std.Build;
const OptimizeMode = std.builtin.OptimizeMode;
const ResolvedTarget = std.Build.ResolvedTarget;

pub fn build(b: *Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const dep_sokol = b.dependency("sokol", .{
        .target = target,
        .optimize = optimize,
    });

    const hello = b.addExecutable(.{
        .name = "hello",
        .target = target,
        .optimize = optimize,
        .root_source_file = b.path("src/hello.zig"),
    });
    hello.root_module.addImport("sokol", dep_sokol.module("sokol"));
    b.installArtifact(hello);

    const triangle = b.addExecutable(.{
        .name = "triangle",
        .target = target,
        .optimize = optimize,
        .root_source_file = b.path("src/triangle.zig"),
    });
    triangle.root_module.addImport("sokol", dep_sokol.module("sokol"));
    b.installArtifact(triangle);
    const runo = b.addRunArtifact(triangle);
    b.step("run-triangle", "run triangle").dependOn(&runo.step);
    const run = b.addRunArtifact(hello);
    b.step("run", "Run hello").dependOn(&run.step);

    buildExample(b, "src/1-5-shaders/1-in-out.zig", "in-out", target, optimize);
    buildExample(b, "src/1-5-shaders/2-uniforms.zig", "uniforms", target, optimize);
    buildExample(b, "src/1-5-shaders/3-attributes.zig", "attributes", target, optimize);
}

fn buildExample(b: *Build, path: []const u8, comptime name: []const u8, target: ResolvedTarget, optimize: OptimizeMode) void {
    const triangle = b.addExecutable(.{
        .name = name,
        .target = target,
        .optimize = optimize,
        .root_source_file = b.path(path),
    });
    const dep_sokol = b.dependency("sokol", .{
        .target = target,
        .optimize = optimize,
    });
    triangle.root_module.addImport("sokol", dep_sokol.module("sokol"));
    b.installArtifact(triangle);
    const runo = b.addRunArtifact(triangle);
    b.step("run-" ++ name, "run " ++ name).dependOn(&runo.step);
}
