const sokol = @import("sokol");
const slog = sokol.log;
const sg = sokol.gfx;
const sapp = sokol.app;
const sglue = sokol.glue;
const stime = sokol.time;
const print = @import("std").debug.print;
const shd = @import("shaders.glsl.zig");
const std = @import("std");
const m = @import("math");
const zalg = @import("zalgebra");
const c = @cImport({
    @cInclude("stb_image.h");
});

const containerImage = @embedFile("container.jpg");
const awesomfaceImage = @embedFile("awesomeface.png");

const state = struct {
    var bind: sg.Bindings = .{};
    var pip: sg.Pipeline = .{};
    var pass_action: sg.PassAction = .{};
    const cube_positions: [10]zalg.Vec3 = .{
        zalg.Vec3.new(0.0, 0.0, 0.0),
        zalg.Vec3.new(2.0, 5.0, -15.0),
        zalg.Vec3.new(-1.5, -2.2, -2.5),
        zalg.Vec3.new(-3.8, -2.0, -12.3),
        zalg.Vec3.new(2.4, -0.4, -3.5),
        zalg.Vec3.new(-1.7, 3.0, -7.5),
        zalg.Vec3.new(1.3, -2.0, -2.5),
        zalg.Vec3.new(1.5, 2.0, -2.5),
        zalg.Vec3.new(1.5, 0.2, -1.5),
        zalg.Vec3.new(-1.3, 1.0, -1.5),
    };
};

export fn init() void {
    sg.setup(.{
        .environment = sglue.environment(),
        .logger = .{ .func = slog.func },
    });

    stime.setup();

    // flip images vertically after loading
    c.stbi_set_flip_vertically_on_load(1);

    loadImage(containerImage.ptr, containerImage.len, shd.SLOT__texture1);
    loadImage(awesomfaceImage.ptr, awesomfaceImage.len, shd.SLOT__texture2);

    state.bind.fs.samplers[shd.SLOT_texture1_smp] = sg.makeSampler(.{});
    state.bind.fs.samplers[shd.SLOT_texture2_smp] = sg.makeSampler(.{});
    state.bind.vertex_buffers[0] = sg.makeBuffer(.{
        .data = sg.asRange(&[_]f32{
            // positions     //texture coordinates
            -0.5, -0.5, -0.5, 0.0, 0.0,
            0.5,  -0.5, -0.5, 1.0, 0.0,
            0.5,  0.5,  -0.5, 1.0, 1.0,
            0.5,  0.5,  -0.5, 1.0, 1.0,
            -0.5, 0.5,  -0.5, 0.0, 1.0,
            -0.5, -0.5, -0.5, 0.0, 0.0,

            -0.5, -0.5, 0.5,  0.0, 0.0,
            0.5,  -0.5, 0.5,  1.0, 0.0,
            0.5,  0.5,  0.5,  1.0, 1.0,
            0.5,  0.5,  0.5,  1.0, 1.0,
            -0.5, 0.5,  0.5,  0.0, 1.0,
            -0.5, -0.5, 0.5,  0.0, 0.0,

            -0.5, 0.5,  0.5,  1.0, 0.0,
            -0.5, 0.5,  -0.5, 1.0, 1.0,
            -0.5, -0.5, -0.5, 0.0, 1.0,
            -0.5, -0.5, -0.5, 0.0, 1.0,
            -0.5, -0.5, 0.5,  0.0, 0.0,
            -0.5, 0.5,  0.5,  1.0, 0.0,

            0.5,  0.5,  0.5,  1.0, 0.0,
            0.5,  0.5,  -0.5, 1.0, 1.0,
            0.5,  -0.5, -0.5, 0.0, 1.0,
            0.5,  -0.5, -0.5, 0.0, 1.0,
            0.5,  -0.5, 0.5,  0.0, 0.0,
            0.5,  0.5,  0.5,  1.0, 0.0,

            -0.5, -0.5, -0.5, 0.0, 1.0,
            0.5,  -0.5, -0.5, 1.0, 1.0,
            0.5,  -0.5, 0.5,  1.0, 0.0,
            0.5,  -0.5, 0.5,  1.0, 0.0,
            -0.5, -0.5, 0.5,  0.0, 0.0,
            -0.5, -0.5, -0.5, 0.0, 1.0,

            -0.5, 0.5,  -0.5, 0.0, 1.0,
            0.5,  0.5,  -0.5, 1.0, 1.0,
            0.5,  0.5,  0.5,  1.0, 0.0,
            0.5,  0.5,  0.5,  1.0, 0.0,
            -0.5, 0.5,  0.5,  0.0, 0.0,
            -0.5, 0.5,  -0.5, 0.0, 1.0,
        }),
    });

    var pip_desc: sg.PipelineDesc = .{ .shader = sg.makeShader(shd.simpleShaderDesc(sg.queryBackend())) };
    pip_desc.layout.attrs[shd.ATTR_vs_aPos].format = .FLOAT3;
    pip_desc.layout.attrs[shd.ATTR_vs_aTexCoord].format = .FLOAT2;
    pip_desc.depth = .{
        .compare = .LESS_EQUAL,
        .write_enabled = true,
    };

    state.pip = sg.makePipeline(pip_desc);

    state.pass_action.colors[0] = .{
        .load_action = .CLEAR,
        .clear_value = .{ .r = 0.2, .g = 0.3, .b = 0.3, .a = 1 },
    };

    print("Backend {}\n", .{sg.queryBackend()});
}

fn loadImage(image: [*:0]const u8, len: c_int, shader_slot: u8) void {
    // Load the image
    var x: c_int = 0;
    var y: c_int = 0;
    var channels_in_file: c_int = 0;

    const data = c.stbi_load_from_memory(image, len, &x, &y, &channels_in_file, 4);
    if (data == null) {
        std.log.err("Failed to load image", .{});
        return;
    }
    defer c.stbi_image_free(data);
    const width: usize = @intCast(x);
    const height: usize = @intCast(y);
    const img_size = width * height * 4;

    var img_desc: sg.ImageDesc = .{ .width = x, .height = y, .pixel_format = .RGBA8 };
    img_desc.data.subimage[0][0] = .{
        .ptr = data,
        .size = img_size,
    };
    state.bind.fs.images[shader_slot] = sg.makeImage(img_desc);
}

export fn frame() void {
    // note that we're translating the scene in the reverse direction of where we want to move
    const view = zalg.Mat4.identity().translate(zalg.Vec3.new(0.0, 0.0, -3.0));
    const width: f32 = @floatFromInt(sapp.width());
    const height: f32 = @floatFromInt(sapp.height());
    const projection = zalg.perspective(45, width / height, 0.1, 100.0);
    sg.beginPass(.{ .action = state.pass_action, .swapchain = sglue.swapchain() });
    sg.applyPipeline(state.pip);
    sg.applyBindings(state.bind);
    var vs_params: shd.VsParams = .{
        .view = view,
        .projection = projection,
        .model = zalg.Mat4.identity(),
    };
    for (0..10) |i| {
        // rotate the cubes at varying speeds. Add 1 so that the first cube rotates
        const angle: f32 = @floatFromInt(i + 1);
        const model = zalg.Mat4.identity().translate(state.cube_positions[i]).rotate(@floatCast(stime.sec(stime.now()) * 20 * angle), zalg.Vec3.new(1.0, 0.3, 0.5));
        vs_params.model = model;
        sg.applyUniforms(.VS, shd.SLOT_vs_params, sg.asRange(&vs_params));
        sg.draw(0, 36, 1);
    }
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
