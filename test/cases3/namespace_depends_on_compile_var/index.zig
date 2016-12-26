fn namespaceDependsOnCompileVar() {
    @setFnTest(this);

    if (some_namespace.a_bool) {
        assert(some_namespace.a_bool);
    } else {
        assert(!some_namespace.a_bool);
    }
}
const some_namespace = switch(@compileVar("os")) {
    Os.linux => @import("cases3/namespace_depends_on_compile_var/a.zig"),
    else => @import("cases3/namespace_depends_on_compile_var/b.zig"),
};

// TODO const assert = @import("std").debug.assert;
fn assert(ok: bool) {
    if (!ok)
        @unreachable();
}
