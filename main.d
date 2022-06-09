import std.stdio : writeln;

static import md_static_import;

shared static this() {
  writeln("main : shared static this");
}

void main() {
  md_static_import.do_nothing();
}
