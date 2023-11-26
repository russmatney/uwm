const Build = @import("std").build;

pub fn build(b: *Build) void {
    var exe = b.addExecutable(Build.ExecutableOptions{.name="uwm"});
    exe.setExecCmd(&[_]?[]const u8{"uwm", "src/main.zig"});
    // var step = b.addTranslateC(.{});
    // step.addIncludeDir("/usr/include/");
    exe.linkSystemLibrary("c");
    exe.linkSystemLibrary("x11");
    exe.linkSystemLibrary("xinerama");
    exe.linkSystemLibrary("freetype");
    exe.linkSystemLibrary("Xft");
    exe.install();

    const run = b.step("run", "run the program");
    run.dependOn(&exe.run().step);

    const runTests = b.addTest("src/test.zig");
    runTests.addIncludeDir("/usr/include");
    runTests.linkSystemLibrary("c");
    runTests.linkSystemLibrary("x11");
    runTests.linkSystemLibrary("xinerama");
    runTests.linkSystemLibrary("freetype");
    runTests.linkSystemLibrary("Xft");
    const testStep = b.step("test", "Run tests");
    testStep.dependOn(&runTests.step);
}
