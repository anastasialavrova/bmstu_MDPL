MASM /Zi main.txt,,,;
MASM /Zi scan.txt,,,;
MASM /Zi signed.txt,,,; 
MASM /Zi unsigned.txt,,,; 
LINK /CO main.obj scan.obj signed.obj unsigned.obj,,;

del *.MAP
del *.CRF
del *.LST
del *.OBJ
