const std = @import("std");
const processor = @import("processor.zig");
const devices = @import("devices.zig");

const KIBI = 1024;

const Compu1600 = struct {
    cpu: processor.Processor = {},
    devices: devices.Ports = {},
};
