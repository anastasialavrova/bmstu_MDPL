@echo on
MASM.EXE /ZI main.asm,,,;
MASM.EXE /ZI scan.asm,,,;
MASM.EXE /ZI signed.asm,,,;
MASM.EXE /ZI unsigned.asm,,,;
link.exe /CO main.obj scan_num.obj signed.obj unsigned.obj,,,;
del *.obj
del *.crf
del *.lst
del *.map
