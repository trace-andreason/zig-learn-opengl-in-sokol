const std = @import("std");

const Build = std.Build;
const OptimizeMode = std.builtin.OptimizeMode;
const ResolvedTarget = std.Build.ResolvedTarget;

pub fn build(b: *Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const examples: [5]exampleBuildConfig = .{ .{
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
    } };

    inline for (examples) |example| {
        buildExample(b, example, target, optimize);
    }
}

const exampleBuildConfig = struct {
    name: []const u8,
    path: []const u8,
};

fn buildExample(b: *Build, comptime conf: exampleBuildConfig, target: ResolvedTarget, optimize: OptimizeMode) void {
    const triangle = b.addExecutable(.{
        .name = conf.name,
        .target = target,
        .optimize = optimize,
        .root_source_file = b.path(conf.path),
    });
    const dep_sokol = b.dependency("sokol", .{
        .target = target,
        .optimize = optimize,
    });
    triangle.root_module.addImport("sokol", dep_sokol.module("sokol"));
    b.installArtifact(triangle);
    const runo = b.addRunArtifact(triangle);
    b.step("run-" ++ conf.name, "run " ++ conf.name).dependOn(&runo.step);
}
