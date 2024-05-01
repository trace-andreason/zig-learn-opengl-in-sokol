const std = @import("std");

const Build = std.Build;
const OptimizeMode = std.builtin.OptimizeMode;

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
}
