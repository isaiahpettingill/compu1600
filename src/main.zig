const std = @import("std");
const compu1600 = @import("compu1600");
const processor = @import("processor.zig");

pub fn main() !void {
    var buffer: [compu1600.KIBI * 64]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const ram = fba.allocator();

    const cpu = processor.Processor{};
}
