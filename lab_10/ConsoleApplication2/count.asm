.386
.model FLAT, C

PUBLIC Count

.CODE
Count:
	PUSH EBP
	MOV EBP, ESP
	
	MOV EBX, [EBP + 8] ; X
	MOV ECX, [EBP + 12]	; L
	
    MOV EAX, 0 ;���������� 1
    MOV EDX, 0 ;������� �� �����
	
loopc:
	BT [EBX], EDX ; �������� � CF
	JNC zero ; ������� �� ���?
	INC EAX

zero:
	INC EDX
		
next_loopc:
	LOOP loopc

	POP EBP	
	RET
END
