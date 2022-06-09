module dsostub;

import core.stdc.stdio : printf;

version(linux) {
  import core.runtime : rt_init, rt_term;
  pragma(crt_constructor)
  private extern (C) void Dstart() {
    printf("dsostub : crt_constructor\n");
    rt_init();
  }
  
  pragma(crt_destructor)
  private extern (C) void Dstop() {
    rt_term();
  }
  version = supported;
}

// http://stuff.benjamin-thaut.de/D/getting_started.html
// mixin SimpleDllMain!(DllIsUsedFromC.no);

version(Windows) {
  //import core.sys.windows.windows;
  import core.sys.windows.dll;
  mixin SimpleDllMain;

  version = supported;
}

version(supported) {
} else {
  static assert(0);   // Operating system/platform not supported
}
