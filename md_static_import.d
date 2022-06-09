module md_static_import;
import std.stdio : writeln;

immutable __gshared int set_once = void;

shared static this () {
  set_once = 42;
  writeln("md_static_import : shared static this");
}

void do_nothing() {}
