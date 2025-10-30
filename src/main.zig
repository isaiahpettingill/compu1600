const std = @import("std");
const compu1600 = @import("compu1600");
const processor = @import("processor.zig");

const KIBI = 1024;

pub fn main() !void {
    var buffer: [KIBI * 64]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const ram = fba.allocator();

    const registers = processor.Registers{ .ra = 0, .rb = 0, .rc = 0, .rs = 0, .rx = 0, .ry = 0 };
}
