REM Needs Microsoft C Compiler cl.exe

IF "%~1"=="clean" GOTO clean

cl emitter_test.c emitter.c
emitter_test.exe
cl system_test.c system.c -DWIN32
system_test.exe
cl cpu_test.c cpu.c emitter.obj system.obj
cpu_test.exe
cl cpu_hello_world.c cpu.obj system.obj emitter.obj
cl big_endian_test.c big_endian.c
big_endian_test.exe 
cl runtime_test.c runtime.c big_endian.obj cpu.obj system.obj emitter.obj
runtime_test.exe
cl alloc_free_test.c alloc_free.c
alloc_free_test.exe
cl tables_test.c tables.c alloc_free.obj
tables_test.exe
cl source_test.c source.c
source_test.exe
cl scanner_test.c scanner.c source.obj
scanner_test.exe
cl np0.c parser.c generator.c scanner.obj source.obj tables.obj alloc_free.obj runtime.obj big_endian.obj cpu.obj system.obj emitter.obj
cl npx0.c parser.obj generator.obj scanner.obj source.obj tables.obj alloc_free.obj runtime.obj big_endian.obj cpu.obj system.obj emitter.obj
np0.exe test01
np0.exe test05
np0.exe test07
np0.exe test11
np0.exe test13
np0.exe test17
np0.exe test19

GOTO end

:clean

DEL *.obj
DEL *.exe
DEL *.npx0
DEL tmp_test_file_write_read

:end
