# blobby

Experimenting with SDFs.

[![youtube demo video](http://img.youtube.com/vi/iAyRDgh6Sdw/0.jpg)](https://www.youtube.com/watch?v=iAyRDgh6Sdw)

## Compiling

### Linux

Dependencies: cmake, ninja, gcc/clang

```sh
./configure-ninja.sh
./compile-shaders.sh
./compile.sh
```

Run: `./build/debug-ninja/blobby`

## Credits

Third-party code used.

### Shaders

SDF shapes from Inigo Quilez: https://iquilezles.org/articles/distfunctions/

Color palette functions from Inigo Quilez: https://iquilezles.org/articles/palettes/

Palettes generated with http://dev.thi.ng/gradients/

### sdl-bgfx-imgui-starter

https://github.com/pr0g/sdl-bgfx-imgui-starter

```
MIT License

Copyright (c) 2022 Tom Hulton-Harrop

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```