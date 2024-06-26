const sg = @import("sokol").gfx;
//
//  #version:1# (machine generated, don't edit!)
//
//  Generated by sokol-shdc (https://github.com/floooh/sokol-tools)
//
//  Cmdline: sokol-shdc -i /Users/twork/Documents/zig/test/src/1-5-shaders/1-in-out.glsl -o /Users/twork/Documents/zig/test/src/shaders/1-in-out.glsl.zig -f sokol_zig -l glsl330:metal_macos:hlsl4:glsl300es:wgsl
//
//  Overview:
//
//      Shader program 'simple':
//          Get shader desc: shd.simpleShaderDesc(sg.queryBackend());
//          Vertex shader: vs
//              Attribute slots:
//                  ATTR_vs_position = 0
//          Fragment shader: fs
//
//
pub const ATTR_vs_position = 0;
//
// #version 330
// 
// layout(location = 0) in vec4 position;
// out vec4 vertexColor;
// 
// void main()
// {
//     gl_Position = vec4(position.x, position.y, position.z, 1.0);
//     vertexColor = vec4(0.5, 0.0, 0.0, 1.0);
// }
// 
//
const vs_source_glsl330 = [203]u8 {
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x33,0x33,0x30,0x0a,0x0a,0x6c,0x61,
    0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,
    0x30,0x29,0x20,0x69,0x6e,0x20,0x76,0x65,0x63,0x34,0x20,0x70,0x6f,0x73,0x69,0x74,
    0x69,0x6f,0x6e,0x3b,0x0a,0x6f,0x75,0x74,0x20,0x76,0x65,0x63,0x34,0x20,0x76,0x65,
    0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,
    0x20,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x67,0x6c,
    0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x76,0x65,0x63,0x34,
    0x28,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x78,0x2c,0x20,0x70,0x6f,0x73,
    0x69,0x74,0x69,0x6f,0x6e,0x2e,0x79,0x2c,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,
    0x6e,0x2e,0x7a,0x2c,0x20,0x31,0x2e,0x30,0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x76,
    0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x76,0x65,0x63,
    0x34,0x28,0x30,0x2e,0x35,0x2c,0x20,0x30,0x2e,0x30,0x2c,0x20,0x30,0x2e,0x30,0x2c,
    0x20,0x31,0x2e,0x30,0x29,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
};
//
// #version 330
// 
// layout(location = 0) out vec4 FragColor;
// in vec4 vertexColor;
// 
// void main()
// {
//     FragColor = vertexColor;
// }
// 
//
const fs_source_glsl330 = [124]u8 {
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x33,0x33,0x30,0x0a,0x0a,0x6c,0x61,
    0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,
    0x30,0x29,0x20,0x6f,0x75,0x74,0x20,0x76,0x65,0x63,0x34,0x20,0x46,0x72,0x61,0x67,
    0x43,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x69,0x6e,0x20,0x76,0x65,0x63,0x34,0x20,0x76,
    0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x0a,0x76,0x6f,0x69,
    0x64,0x20,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x46,
    0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x76,0x65,0x72,0x74,0x65,
    0x78,0x43,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
};
//
// #version 300 es
// 
// layout(location = 0) in vec4 position;
// out vec4 vertexColor;
// 
// void main()
// {
//     gl_Position = vec4(position.x, position.y, position.z, 1.0);
//     vertexColor = vec4(0.5, 0.0, 0.0, 1.0);
// }
// 
//
const vs_source_glsl300es = [206]u8 {
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x33,0x30,0x30,0x20,0x65,0x73,0x0a,
    0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,
    0x20,0x3d,0x20,0x30,0x29,0x20,0x69,0x6e,0x20,0x76,0x65,0x63,0x34,0x20,0x70,0x6f,
    0x73,0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x6f,0x75,0x74,0x20,0x76,0x65,0x63,0x34,
    0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x0a,0x76,
    0x6f,0x69,0x64,0x20,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,
    0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x76,
    0x65,0x63,0x34,0x28,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x78,0x2c,0x20,
    0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x79,0x2c,0x20,0x70,0x6f,0x73,0x69,
    0x74,0x69,0x6f,0x6e,0x2e,0x7a,0x2c,0x20,0x31,0x2e,0x30,0x29,0x3b,0x0a,0x20,0x20,
    0x20,0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,
    0x76,0x65,0x63,0x34,0x28,0x30,0x2e,0x35,0x2c,0x20,0x30,0x2e,0x30,0x2c,0x20,0x30,
    0x2e,0x30,0x2c,0x20,0x31,0x2e,0x30,0x29,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
};
//
// #version 300 es
// precision mediump float;
// precision highp int;
// 
// layout(location = 0) out highp vec4 FragColor;
// in highp vec4 vertexColor;
// 
// void main()
// {
//     FragColor = vertexColor;
// }
// 
//
const fs_source_glsl300es = [185]u8 {
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x33,0x30,0x30,0x20,0x65,0x73,0x0a,
    0x70,0x72,0x65,0x63,0x69,0x73,0x69,0x6f,0x6e,0x20,0x6d,0x65,0x64,0x69,0x75,0x6d,
    0x70,0x20,0x66,0x6c,0x6f,0x61,0x74,0x3b,0x0a,0x70,0x72,0x65,0x63,0x69,0x73,0x69,
    0x6f,0x6e,0x20,0x68,0x69,0x67,0x68,0x70,0x20,0x69,0x6e,0x74,0x3b,0x0a,0x0a,0x6c,
    0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,
    0x20,0x30,0x29,0x20,0x6f,0x75,0x74,0x20,0x68,0x69,0x67,0x68,0x70,0x20,0x76,0x65,
    0x63,0x34,0x20,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x69,0x6e,
    0x20,0x68,0x69,0x67,0x68,0x70,0x20,0x76,0x65,0x63,0x34,0x20,0x76,0x65,0x72,0x74,
    0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,0x6d,
    0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x46,0x72,0x61,0x67,
    0x43,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,
    0x6c,0x6f,0x72,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
};
//
// static float4 gl_Position;
// static float4 position;
// static float4 vertexColor;
// 
// struct SPIRV_Cross_Input
// {
//     float4 position : TEXCOORD0;
// };
// 
// struct SPIRV_Cross_Output
// {
//     float4 vertexColor : TEXCOORD0;
//     float4 gl_Position : SV_Position;
// };
// 
// void vert_main()
// {
//     gl_Position = float4(position.x, position.y, position.z, 1.0f);
//     vertexColor = float4(0.5f, 0.0f, 0.0f, 1.0f);
// }
// 
// SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
// {
//     position = stage_input.position;
//     vert_main();
//     SPIRV_Cross_Output stage_output;
//     stage_output.gl_Position = gl_Position;
//     stage_output.vertexColor = vertexColor;
//     return stage_output;
// }
//
const vs_source_hlsl4 = [653]u8 {
    0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x67,0x6c,
    0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,
    0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,
    0x6e,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,
    0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x0a,0x73,
    0x74,0x72,0x75,0x63,0x74,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,
    0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,
    0x6f,0x61,0x74,0x34,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3a,0x20,
    0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,0x30,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x73,
    0x74,0x72,0x75,0x63,0x74,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,
    0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x6c,0x6f,0x61,0x74,0x34,0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,
    0x72,0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,0x30,0x3b,0x0a,0x20,
    0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,
    0x69,0x74,0x69,0x6f,0x6e,0x20,0x3a,0x20,0x53,0x56,0x5f,0x50,0x6f,0x73,0x69,0x74,
    0x69,0x6f,0x6e,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,0x76,0x65,
    0x72,0x74,0x5f,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,
    0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x66,0x6c,
    0x6f,0x61,0x74,0x34,0x28,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x78,0x2c,
    0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x79,0x2c,0x20,0x70,0x6f,0x73,
    0x69,0x74,0x69,0x6f,0x6e,0x2e,0x7a,0x2c,0x20,0x31,0x2e,0x30,0x66,0x29,0x3b,0x0a,
    0x20,0x20,0x20,0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x20,
    0x3d,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x28,0x30,0x2e,0x35,0x66,0x2c,0x20,0x30,
    0x2e,0x30,0x66,0x2c,0x20,0x30,0x2e,0x30,0x66,0x2c,0x20,0x31,0x2e,0x30,0x66,0x29,
    0x3b,0x0a,0x7d,0x0a,0x0a,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,
    0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x20,0x6d,0x61,0x69,0x6e,0x28,0x53,0x50,0x49,
    0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,0x20,0x73,
    0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x29,0x0a,0x7b,0x0a,0x20,0x20,
    0x20,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x73,0x74,0x61,
    0x67,0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x2e,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,
    0x6e,0x3b,0x0a,0x20,0x20,0x20,0x20,0x76,0x65,0x72,0x74,0x5f,0x6d,0x61,0x69,0x6e,
    0x28,0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,
    0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x20,0x73,0x74,0x61,0x67,0x65,
    0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,0x20,0x20,0x20,0x20,0x73,0x74,0x61,
    0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x2e,0x67,0x6c,0x5f,0x50,0x6f,0x73,
    0x69,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,
    0x69,0x6f,0x6e,0x3b,0x0a,0x20,0x20,0x20,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,
    0x75,0x74,0x70,0x75,0x74,0x2e,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,
    0x72,0x20,0x3d,0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x3b,
    0x0a,0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,0x73,0x74,0x61,0x67,
    0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,0x7d,0x0a,0x00,
};
//
// static float4 FragColor;
// static float4 vertexColor;
// 
// struct SPIRV_Cross_Input
// {
//     float4 vertexColor : TEXCOORD0;
// };
// 
// struct SPIRV_Cross_Output
// {
//     float4 FragColor : SV_Target0;
// };
// 
// void frag_main()
// {
//     FragColor = vertexColor;
// }
// 
// SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
// {
//     vertexColor = stage_input.vertexColor;
//     frag_main();
//     SPIRV_Cross_Output stage_output;
//     stage_output.FragColor = FragColor;
//     return stage_output;
// }
//
const fs_source_hlsl4 = [460]u8 {
    0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x46,0x72,
    0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,
    0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,
    0x6f,0x72,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x53,0x50,0x49,0x52,
    0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,0x0a,0x7b,0x0a,
    0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x76,0x65,0x72,0x74,0x65,
    0x78,0x43,0x6f,0x6c,0x6f,0x72,0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,
    0x44,0x30,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x53,
    0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,
    0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x46,
    0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,0x20,0x3a,0x20,0x53,0x56,0x5f,0x54,0x61,
    0x72,0x67,0x65,0x74,0x30,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,
    0x66,0x72,0x61,0x67,0x5f,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,
    0x20,0x20,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x76,0x65,
    0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x7d,0x0a,0x0a,0x53,0x50,
    0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,
    0x20,0x6d,0x61,0x69,0x6e,0x28,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,
    0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,
    0x70,0x75,0x74,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x76,0x65,0x72,0x74,0x65,
    0x78,0x43,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,
    0x6e,0x70,0x75,0x74,0x2e,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,
    0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x72,0x61,0x67,0x5f,0x6d,0x61,0x69,0x6e,0x28,
    0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,
    0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,
    0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,0x20,0x20,0x20,0x20,0x73,0x74,0x61,0x67,
    0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x2e,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,
    0x6f,0x72,0x20,0x3d,0x20,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,
    0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,0x73,0x74,0x61,0x67,0x65,
    0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,0x7d,0x0a,0x00,
};
//
// #include <metal_stdlib>
// #include <simd/simd.h>
// 
// using namespace metal;
// 
// struct main0_out
// {
//     float4 vertexColor [[user(locn0)]];
//     float4 gl_Position [[position]];
// };
// 
// struct main0_in
// {
//     float4 position [[attribute(0)]];
// };
// 
// vertex main0_out main0(main0_in in [[stage_in]])
// {
//     main0_out out = {};
//     out.gl_Position = float4(in.position.x, in.position.y, in.position.z, 1.0);
//     out.vertexColor = float4(0.5, 0.0, 0.0, 1.0);
//     return out;
// }
// 
//
const vs_source_metal_macos = [457]u8 {
    0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,0x20,0x3c,0x6d,0x65,0x74,0x61,0x6c,0x5f,
    0x73,0x74,0x64,0x6c,0x69,0x62,0x3e,0x0a,0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,
    0x20,0x3c,0x73,0x69,0x6d,0x64,0x2f,0x73,0x69,0x6d,0x64,0x2e,0x68,0x3e,0x0a,0x0a,
    0x75,0x73,0x69,0x6e,0x67,0x20,0x6e,0x61,0x6d,0x65,0x73,0x70,0x61,0x63,0x65,0x20,
    0x6d,0x65,0x74,0x61,0x6c,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x6d,
    0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x6c,0x6f,0x61,0x74,0x34,0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,
    0x72,0x20,0x5b,0x5b,0x75,0x73,0x65,0x72,0x28,0x6c,0x6f,0x63,0x6e,0x30,0x29,0x5d,
    0x5d,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x67,0x6c,
    0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x5b,0x5b,0x70,0x6f,0x73,0x69,
    0x74,0x69,0x6f,0x6e,0x5d,0x5d,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,
    0x63,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x69,0x6e,0x0a,0x7b,0x0a,0x20,0x20,
    0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,
    0x6e,0x20,0x5b,0x5b,0x61,0x74,0x74,0x72,0x69,0x62,0x75,0x74,0x65,0x28,0x30,0x29,
    0x5d,0x5d,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x76,0x65,0x72,0x74,0x65,0x78,0x20,0x6d,
    0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x28,0x6d,
    0x61,0x69,0x6e,0x30,0x5f,0x69,0x6e,0x20,0x69,0x6e,0x20,0x5b,0x5b,0x73,0x74,0x61,
    0x67,0x65,0x5f,0x69,0x6e,0x5d,0x5d,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x6d,
    0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,0x74,0x20,0x6f,0x75,0x74,0x20,0x3d,0x20,0x7b,
    0x7d,0x3b,0x0a,0x20,0x20,0x20,0x20,0x6f,0x75,0x74,0x2e,0x67,0x6c,0x5f,0x50,0x6f,
    0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x28,
    0x69,0x6e,0x2e,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x78,0x2c,0x20,0x69,
    0x6e,0x2e,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x79,0x2c,0x20,0x69,0x6e,
    0x2e,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x7a,0x2c,0x20,0x31,0x2e,0x30,
    0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x6f,0x75,0x74,0x2e,0x76,0x65,0x72,0x74,0x65,
    0x78,0x43,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x28,
    0x30,0x2e,0x35,0x2c,0x20,0x30,0x2e,0x30,0x2c,0x20,0x30,0x2e,0x30,0x2c,0x20,0x31,
    0x2e,0x30,0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,
    0x6f,0x75,0x74,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
};
//
// #include <metal_stdlib>
// #include <simd/simd.h>
// 
// using namespace metal;
// 
// struct main0_out
// {
//     float4 FragColor [[color(0)]];
// };
// 
// struct main0_in
// {
//     float4 vertexColor [[user(locn0)]];
// };
// 
// fragment main0_out main0(main0_in in [[stage_in]])
// {
//     main0_out out = {};
//     out.FragColor = in.vertexColor;
//     return out;
// }
// 
//
const fs_source_metal_macos = [325]u8 {
    0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,0x20,0x3c,0x6d,0x65,0x74,0x61,0x6c,0x5f,
    0x73,0x74,0x64,0x6c,0x69,0x62,0x3e,0x0a,0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,
    0x20,0x3c,0x73,0x69,0x6d,0x64,0x2f,0x73,0x69,0x6d,0x64,0x2e,0x68,0x3e,0x0a,0x0a,
    0x75,0x73,0x69,0x6e,0x67,0x20,0x6e,0x61,0x6d,0x65,0x73,0x70,0x61,0x63,0x65,0x20,
    0x6d,0x65,0x74,0x61,0x6c,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x6d,
    0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x6c,0x6f,0x61,0x74,0x34,0x20,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,0x20,
    0x5b,0x5b,0x63,0x6f,0x6c,0x6f,0x72,0x28,0x30,0x29,0x5d,0x5d,0x3b,0x0a,0x7d,0x3b,
    0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x69,
    0x6e,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x76,
    0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x20,0x5b,0x5b,0x75,0x73,0x65,
    0x72,0x28,0x6c,0x6f,0x63,0x6e,0x30,0x29,0x5d,0x5d,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,
    0x66,0x72,0x61,0x67,0x6d,0x65,0x6e,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x6f,
    0x75,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x28,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x69,
    0x6e,0x20,0x69,0x6e,0x20,0x5b,0x5b,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x5d,
    0x5d,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x6f,
    0x75,0x74,0x20,0x6f,0x75,0x74,0x20,0x3d,0x20,0x7b,0x7d,0x3b,0x0a,0x20,0x20,0x20,
    0x20,0x6f,0x75,0x74,0x2e,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,0x20,0x3d,
    0x20,0x69,0x6e,0x2e,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x3b,
    0x0a,0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,0x6f,0x75,0x74,0x3b,
    0x0a,0x7d,0x0a,0x0a,0x00,
};
//
// diagnostic(off, derivative_uniformity);
// 
// var<private> position_1 : vec4f;
// 
// var<private> vertexColor : vec4f;
// 
// var<private> gl_Position : vec4f;
// 
// fn main_1() {
//   let x_21 : f32 = position_1.x;
//   let x_23 : f32 = position_1.y;
//   let x_26 : f32 = position_1.z;
//   gl_Position = vec4f(x_21, x_23, x_26, 1.0f);
//   vertexColor = vec4f(0.5f, 0.0f, 0.0f, 1.0f);
//   return;
// }
// 
// struct main_out {
//   @builtin(position)
//   gl_Position : vec4f,
//   @location(0)
//   vertexColor_1 : vec4f,
// }
// 
// @vertex
// fn main(@location(0) position_1_param : vec4f) -> main_out {
//   position_1 = position_1_param;
//   main_1();
//   return main_out(gl_Position, vertexColor);
// }
// 
//
const vs_source_wgsl = [633]u8 {
    0x64,0x69,0x61,0x67,0x6e,0x6f,0x73,0x74,0x69,0x63,0x28,0x6f,0x66,0x66,0x2c,0x20,
    0x64,0x65,0x72,0x69,0x76,0x61,0x74,0x69,0x76,0x65,0x5f,0x75,0x6e,0x69,0x66,0x6f,
    0x72,0x6d,0x69,0x74,0x79,0x29,0x3b,0x0a,0x0a,0x76,0x61,0x72,0x3c,0x70,0x72,0x69,
    0x76,0x61,0x74,0x65,0x3e,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x5f,0x31,
    0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x3b,0x0a,0x0a,0x76,0x61,0x72,0x3c,0x70,
    0x72,0x69,0x76,0x61,0x74,0x65,0x3e,0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,
    0x6c,0x6f,0x72,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x3b,0x0a,0x0a,0x76,0x61,
    0x72,0x3c,0x70,0x72,0x69,0x76,0x61,0x74,0x65,0x3e,0x20,0x67,0x6c,0x5f,0x50,0x6f,
    0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x3b,0x0a,
    0x0a,0x66,0x6e,0x20,0x6d,0x61,0x69,0x6e,0x5f,0x31,0x28,0x29,0x20,0x7b,0x0a,0x20,
    0x20,0x6c,0x65,0x74,0x20,0x78,0x5f,0x32,0x31,0x20,0x3a,0x20,0x66,0x33,0x32,0x20,
    0x3d,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x5f,0x31,0x2e,0x78,0x3b,0x0a,
    0x20,0x20,0x6c,0x65,0x74,0x20,0x78,0x5f,0x32,0x33,0x20,0x3a,0x20,0x66,0x33,0x32,
    0x20,0x3d,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x5f,0x31,0x2e,0x79,0x3b,
    0x0a,0x20,0x20,0x6c,0x65,0x74,0x20,0x78,0x5f,0x32,0x36,0x20,0x3a,0x20,0x66,0x33,
    0x32,0x20,0x3d,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x5f,0x31,0x2e,0x7a,
    0x3b,0x0a,0x20,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,
    0x3d,0x20,0x76,0x65,0x63,0x34,0x66,0x28,0x78,0x5f,0x32,0x31,0x2c,0x20,0x78,0x5f,
    0x32,0x33,0x2c,0x20,0x78,0x5f,0x32,0x36,0x2c,0x20,0x31,0x2e,0x30,0x66,0x29,0x3b,
    0x0a,0x20,0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x20,0x3d,
    0x20,0x76,0x65,0x63,0x34,0x66,0x28,0x30,0x2e,0x35,0x66,0x2c,0x20,0x30,0x2e,0x30,
    0x66,0x2c,0x20,0x30,0x2e,0x30,0x66,0x2c,0x20,0x31,0x2e,0x30,0x66,0x29,0x3b,0x0a,
    0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x3b,0x0a,0x7d,0x0a,0x0a,0x73,0x74,0x72,
    0x75,0x63,0x74,0x20,0x6d,0x61,0x69,0x6e,0x5f,0x6f,0x75,0x74,0x20,0x7b,0x0a,0x20,
    0x20,0x40,0x62,0x75,0x69,0x6c,0x74,0x69,0x6e,0x28,0x70,0x6f,0x73,0x69,0x74,0x69,
    0x6f,0x6e,0x29,0x0a,0x20,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,
    0x6e,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x2c,0x0a,0x20,0x20,0x40,0x6c,0x6f,
    0x63,0x61,0x74,0x69,0x6f,0x6e,0x28,0x30,0x29,0x0a,0x20,0x20,0x76,0x65,0x72,0x74,
    0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x5f,0x31,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,
    0x66,0x2c,0x0a,0x7d,0x0a,0x0a,0x40,0x76,0x65,0x72,0x74,0x65,0x78,0x0a,0x66,0x6e,
    0x20,0x6d,0x61,0x69,0x6e,0x28,0x40,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x28,
    0x30,0x29,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x5f,0x31,0x5f,0x70,0x61,
    0x72,0x61,0x6d,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x29,0x20,0x2d,0x3e,0x20,
    0x6d,0x61,0x69,0x6e,0x5f,0x6f,0x75,0x74,0x20,0x7b,0x0a,0x20,0x20,0x70,0x6f,0x73,
    0x69,0x74,0x69,0x6f,0x6e,0x5f,0x31,0x20,0x3d,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,
    0x6f,0x6e,0x5f,0x31,0x5f,0x70,0x61,0x72,0x61,0x6d,0x3b,0x0a,0x20,0x20,0x6d,0x61,
    0x69,0x6e,0x5f,0x31,0x28,0x29,0x3b,0x0a,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,
    0x20,0x6d,0x61,0x69,0x6e,0x5f,0x6f,0x75,0x74,0x28,0x67,0x6c,0x5f,0x50,0x6f,0x73,
    0x69,0x74,0x69,0x6f,0x6e,0x2c,0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,
    0x6f,0x72,0x29,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
};
//
// diagnostic(off, derivative_uniformity);
// 
// var<private> FragColor : vec4f;
// 
// var<private> vertexColor : vec4f;
// 
// fn main_1() {
//   let x_12 : vec4f = vertexColor;
//   FragColor = x_12;
//   return;
// }
// 
// struct main_out {
//   @location(0)
//   FragColor_1 : vec4f,
// }
// 
// @fragment
// fn main(@location(0) vertexColor_param : vec4f) -> main_out {
//   vertexColor = vertexColor_param;
//   main_1();
//   return main_out(FragColor);
// }
// 
//
const fs_source_wgsl = [402]u8 {
    0x64,0x69,0x61,0x67,0x6e,0x6f,0x73,0x74,0x69,0x63,0x28,0x6f,0x66,0x66,0x2c,0x20,
    0x64,0x65,0x72,0x69,0x76,0x61,0x74,0x69,0x76,0x65,0x5f,0x75,0x6e,0x69,0x66,0x6f,
    0x72,0x6d,0x69,0x74,0x79,0x29,0x3b,0x0a,0x0a,0x76,0x61,0x72,0x3c,0x70,0x72,0x69,
    0x76,0x61,0x74,0x65,0x3e,0x20,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,0x20,
    0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x3b,0x0a,0x0a,0x76,0x61,0x72,0x3c,0x70,0x72,
    0x69,0x76,0x61,0x74,0x65,0x3e,0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,
    0x6f,0x72,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x3b,0x0a,0x0a,0x66,0x6e,0x20,
    0x6d,0x61,0x69,0x6e,0x5f,0x31,0x28,0x29,0x20,0x7b,0x0a,0x20,0x20,0x6c,0x65,0x74,
    0x20,0x78,0x5f,0x31,0x32,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x20,0x3d,0x20,
    0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,0x46,
    0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x78,0x5f,0x31,0x32,0x3b,
    0x0a,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x3b,0x0a,0x7d,0x0a,0x0a,0x73,0x74,
    0x72,0x75,0x63,0x74,0x20,0x6d,0x61,0x69,0x6e,0x5f,0x6f,0x75,0x74,0x20,0x7b,0x0a,
    0x20,0x20,0x40,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x28,0x30,0x29,0x0a,0x20,
    0x20,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,0x5f,0x31,0x20,0x3a,0x20,0x76,
    0x65,0x63,0x34,0x66,0x2c,0x0a,0x7d,0x0a,0x0a,0x40,0x66,0x72,0x61,0x67,0x6d,0x65,
    0x6e,0x74,0x0a,0x66,0x6e,0x20,0x6d,0x61,0x69,0x6e,0x28,0x40,0x6c,0x6f,0x63,0x61,
    0x74,0x69,0x6f,0x6e,0x28,0x30,0x29,0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,
    0x6c,0x6f,0x72,0x5f,0x70,0x61,0x72,0x61,0x6d,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,
    0x66,0x29,0x20,0x2d,0x3e,0x20,0x6d,0x61,0x69,0x6e,0x5f,0x6f,0x75,0x74,0x20,0x7b,
    0x0a,0x20,0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x20,0x3d,
    0x20,0x76,0x65,0x72,0x74,0x65,0x78,0x43,0x6f,0x6c,0x6f,0x72,0x5f,0x70,0x61,0x72,
    0x61,0x6d,0x3b,0x0a,0x20,0x20,0x6d,0x61,0x69,0x6e,0x5f,0x31,0x28,0x29,0x3b,0x0a,
    0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,0x6d,0x61,0x69,0x6e,0x5f,0x6f,0x75,
    0x74,0x28,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,0x29,0x3b,0x0a,0x7d,0x0a,
    0x0a,0x00,
};
pub fn simpleShaderDesc(backend: sg.Backend) sg.ShaderDesc {
    var desc: sg.ShaderDesc = .{};
    switch (backend) {
        .GLCORE33 => {
            desc.attrs[0].name = "position";
            desc.vs.source = &vs_source_glsl330;
            desc.vs.entry = "main";
            desc.fs.source = &fs_source_glsl330;
            desc.fs.entry = "main";
            desc.label = "simple_shader";
        },
        .GLES3 => {
            desc.attrs[0].name = "position";
            desc.vs.source = &vs_source_glsl300es;
            desc.vs.entry = "main";
            desc.fs.source = &fs_source_glsl300es;
            desc.fs.entry = "main";
            desc.label = "simple_shader";
        },
        .D3D11 => {
            desc.attrs[0].sem_name = "TEXCOORD";
            desc.attrs[0].sem_index = 0;
            desc.vs.source = &vs_source_hlsl4;
            desc.vs.d3d11_target = "vs_4_0";
            desc.vs.entry = "main";
            desc.fs.source = &fs_source_hlsl4;
            desc.fs.d3d11_target = "ps_4_0";
            desc.fs.entry = "main";
            desc.label = "simple_shader";
        },
        .METAL_MACOS => {
            desc.vs.source = &vs_source_metal_macos;
            desc.vs.entry = "main0";
            desc.fs.source = &fs_source_metal_macos;
            desc.fs.entry = "main0";
            desc.label = "simple_shader";
        },
        .WGPU => {
            desc.vs.source = &vs_source_wgsl;
            desc.vs.entry = "main";
            desc.fs.source = &fs_source_wgsl;
            desc.fs.entry = "main";
            desc.label = "simple_shader";
        },
        else => {},
    }
    return desc;
}
