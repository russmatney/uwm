//const colors: [_][3]f32 = {
//    {1, 2, 3},
//};

pub const COLOR = enum(u2) {
    FOREGROUND_FOCUS,
    FOREGROUND_NOFOCUS,
    BACKGROUND,
    AMOUNT,
};
pub const COLOR_AMOUNT = @enumToInt(COLOR.AMOUNT);

pub const colors = [COLOR_AMOUNT][3]u16{
    [_]u16{ 255, 0, 0 },
    [_]u16{ 11, 11, 11 },
    [_]u16{ 0, 0, 0 },
};