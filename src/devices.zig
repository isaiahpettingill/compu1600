const std = @import("std");
const processor = @import("processor.zig");

const Controller = struct {
    A: u1,
    B: u1,
    select: u1,
    start: u1,
    up: u1,
    down: u1,
    left: u1,
    right: u1,

    // Not available in 8-bit mode
    X: u1,
    Y: u1,
    rback: u1,
    rleft: u1,

    // Unallocated, always zero
    extra: u4 = 0,
};

const AudioChannel = struct {
    track_start: processor.Word,
    track_end: processor.Word,
    speed: u8 = 1,
    run: bool = false,
};

const AudioOutput = struct {
    channel_1: AudioChannel,
    channel_2: AudioChannel,
    channel_3: AudioChannel,
    channel_5: AudioChannel,
    channel_6: AudioChannel,
    channel_7: AudioChannel,
};

const Disk = struct {
    size: usize,
    reader: std.io.Reader,
};

const Ports = struct {
    controller_1: Controller,
    controller_2: Controller,
    controller_3: Controller,
    controller_4: Controller,

    audio_output: AudioOutput,

    cartridge_1: Disk,
    cartridge_2: Disk,
    cartridge_3: Disk,
    cartridge_4: Disk,
    system: Disk,
};
