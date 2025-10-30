const Register = enum(u4) { RA = 0, RB = 1, RC = 2, RS = 3, RX = 4, RY = 5 };
const Registers = struct {
    ra: u16,
    rb: u16,
    rc: u16,
    rs: u16,
    rx: u16,
    ry: u16,

    fn set(self: *Registers, register: Register, value: u16) !void {
        switch (register) {
            Register.RA => self.ra = value,
            Register.RB => self.rb = value,
            Register.RC => self.rc = value,
            Register.RS => self.rs = value,
            Register.RX => self.rx = value,
            Register.RY => self.ry = value,
            else => error{},
        }
    }

    fn get(self: *Registers, register: Register) !u16 {
        return switch (register) {
            Register.RA => self.ra,
            Register.RB => self.rb,
            Register.RC => self.rc,
            Register.RS => self.rs,
            Register.RX => self.rx,
            Register.RY => self.ry,
            else => error{},
        };
    }
};

const Flags = struct { zf: u1, of: u1, sf: u1 };

const Instruction = enum(u4) {
    HALT = 0x0,
    NOP = 0x1,
};

const Processor = struct {
    registers: Registers,
    flags: Flags,
    PC: u16,
};
