const sokol = @import("sokol");
const slog = sokol.log;
const sg = sokol.gfx;
const sapp = sokol.app;
const sglue = sokol.glue;
const print = @import("std").debug.print;
const shd = @import("1-in-out.glsl.zig");

const state = struct {
    var bind: sg.Bindings = .{};
    var pip: sg.Pipeline = .{};
    var pass_action: sg.PassAction = .{};
};

export fn init() void {
    sg.setup(.{
        .environment = sglue.environment(),
        .logger = .{ .func = slog.func },
    });

    state.bind.vertex_buffers[0] = sg.makeBuffer(.{ .data = sg.asRange(&[_]f32{ -0.5, -0.5, 0.0, 0.5, -0.5, 0.0, 0.0, 0.5, 0.0 }) });

    var pip_desc: sg.PipelineDesc = .{ .shader = sg.makeShader(shd.simpleShaderDesc(sg.queryBackend())) };
    pip_desc.layout.attrs[shd.ATTR_vs_position].format = .FLOAT3;
    state.pip = sg.makePipeline(pip_desc);

    state.pass_action.colors[0] = .{
        .load_action = .CLEAR,
        .clear_value = .{ .r = 0.2, .g = 0.3, .b = 0.3, .a = 1 },
    };

    print("Backend {}\n", .{sg.queryBackend()});
}

export fn frame() void {
    sg.beginPass(.{ .action = state.pass_action, .swapchain = sglue.swapchain() });
    sg.applyPipeline(state.pip);
    sg.applyBindings(state.bind);
    sg.draw(0, 3, 1);
    sg.endPass();
    sg.commit();
}

export fn cleanup() void {
    sg.shutdown();
}

export fn input(ev: ?*const sapp.Event) void {
    const event = ev.?;
    if (event.type == .KEY_DOWN) {
        if (event.key_code == .ESCAPE) {
            sapp.requestQuit();
        }
    }
}

pub fn main() void {
    sapp.run(.{
        .init_cb = init,
        .frame_cb = frame,
        .cleanup_cb = cleanup,
        .event_cb = input,
        .width = 640,
        .height = 480,
        .icon = .{ .sokol_default = true },
        .window_title = "clear.zig",
        .logger = .{ .func = slog.func },
        .win32_console_attach = true,
    });
}
