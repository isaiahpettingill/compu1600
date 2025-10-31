const Word = u16;

const Register = enum(u4) { RA = 0, RB = 1, RC = 2, RS = 3, RX = 4, RY = 5 };
const Registers = struct {
    ra: Word = 0,
    rb: Word = 0,
    rc: Word = 0,
    rs: Word = 0,
    rx: Word = 0,
    ry: Word = 0,

    fn set(self: *Registers, register: Register, value: Word) !void {
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

    fn get(self: *Registers, register: Register) !Word {
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

const Flags = struct { zf: u1 = 0, of: u1 = 0, sf: u1 = 0 };

const Instruction = enum(u4) {
    HALT = 0x0,
    NOP = 0x1,

    MOV = 0x2,
    PUSH = 0x3,
    POP = 0x4,
    MODE = 0x5,
    SYSCALL = 0x6,
    JXX = 0x7,
    CALL = 0x8,
    BOP = 0x9,
    AOP = 0xA,
    CMP = 0xB,
    LOP = 0xC,
};

const Conditions = enum(u4) {
    TT = 0x0,
    EQ = 0x1,
    NE = 0x2,
    LT = 0x3,
    LE = 0x4,
    GT = 0x5,
    GE = 0x6,
};

const BOps = enum(u4) {
    AND = 0x1,
    OR = 0x2,
    NOT = 0x3,
    XOR = 0x4,
    RHS = 0x5,
    LHS = 0x6,
    NRHS = 0x7,
};

const AOps = enum(u4) { ADD = 0x1, SUB = 0x2, DIV = 0x3, MUL = 0x4, MOD = 0x5 };

const LOps = enum(u4) {
    LAND = 0x1,
    LOR = 0x2,
    LNOT = 0x3,
};

const Mode = enum(u1) { MODE8 = 0, MODE16 = 1 };

const Processor = struct {
    registers: Registers = {},
    mode: Mode = Mode.MODE16,
    flags: Flags = {},
    PC: Word = 0,
};
