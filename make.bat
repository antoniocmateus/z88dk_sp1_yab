del build\z88dk-breakout.tap
cls
zcc +zx -v -startup=31 -DWFRAMES=3  -clib=sdcc_iy -SO3 --max-allocs-per-node200000 --fsigned-char "@zproject.lst" -pragma-include:zpragma.inc -o build/z88dk-breakout -m
utils\bas2tap -a10 -sz88break src\loader.bas build\loader.tap
cd build
ren z88dk-breakout.map z88dk-breakout_CODE.map
appmake +zx -b z88dk-breakout_CODE.bin -o game.tap --blockname z88dk-breakout --org 25124 --noloader
copy /b loader.tap + ..\gfx\loading.tap + game.tap z88dk-breakout.tap
del game.tap
del loading.tap
del loader.tap
del z88dk-breakout_*
cd ..

