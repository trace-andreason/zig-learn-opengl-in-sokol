const sokol = @import("sokol");
const slog = sokol.log;
const sg = sokol.gfx;
const sapp = sokol.app;
const sglue = sokol.glue;
const stime = sokol.time;
const print = @import("std").debug.print;
const shd = @import("1-texture.glsl.zig");
const std = @import("std");
const c = @cImport({
    @cInclude("stb_image.h");
});

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

    //const allocator = std.heap.page_allocator();

    // Specify the path to your JPEG file
    const img_path = "./src/1-6-textures/brickwall.jpg";

    // Load the image
    var x: c_int = 0;
    var y: c_int = 0;
    var channels_in_file: c_int = 0;

    const data = c.stbi_load(img_path, &x, &y, &channels_in_file, 4);
    if (data == null) {
        std.log.err("Failed to load image", .{});
        return;
    }
    defer c.stbi_image_free(data);
    const width: usize = @intCast(x);
    const height: usize = @intCast(y);
    const img_size = width * height * 4; // 3 for RGB

    var img_desc: sg.ImageDesc = .{ .width = x, .height = y, .pixel_format = .RGBA8 };
    img_desc.data.subimage[0][0] = .{
        .ptr = data,
        .size = img_size,
    };
    state.bind.fs.images[shd.SLOT__ourTexture] = sg.makeImage(img_desc);

    //sg.initImage(state.bind.fs.images[shd.SLOT__ourTexture], img_desc);
    state.bind.fs.samplers[shd.SLOT_ourTexture_smp] = sg.makeSampler(.{});
    state.bind.vertex_buffers[0] = sg.makeBuffer(.{
        .data = sg.asRange(&[_]f32{
            // positions     //colors       //texture coordinates
            0.5,  0.5,  0.0, 1.0, 0.0, 0.0, 1.0, 1.0,
            0.5,  -0.5, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0,
            -0.5, -0.5, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0,
            -0.5, 0.5,  0.0, 1.0, 1.0, 0.0, 0.0, 1.0,
        }),
    });

    state.bind.index_buffer = sg.makeBuffer(.{ .type = .INDEXBUFFER, .data = sg.asRange(&[_]u16{ 0, 1, 3, 1, 2, 3 }) });

    var pip_desc: sg.PipelineDesc = .{ .shader = sg.makeShader(shd.simpleShaderDesc(sg.queryBackend())) };
    pip_desc.layout.attrs[shd.ATTR_vs_position].format = .FLOAT3;
    pip_desc.layout.attrs[shd.ATTR_vs_aColor].format = .FLOAT3;
    pip_desc.layout.attrs[shd.ATTR_vs_aTexCoord].format = .FLOAT2;
    pip_desc.index_type = .UINT16;

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
