.386
.MODEL FLAT,C

PUBLIC DlinaStroki
.CODE
DlinaStroki:
	PUSH EBP
	MOV EBP,ESP

	PUSH EDI

	MOV EAX, 0
	MOV EDI, [EBP + 8]
	MOV ECX, -1
	REPNE SCASB
	NOT ECX
	DEC ECX
	MOV EAX, ECX

	POP EDI
	POP EBP
	RET

END


	;XOR EAX,EAX
	;MOV EBX, [EBP+8]    ;СТРОКА
	;JMP M1
;M2:
	;INC EAX
;M1:
	;MOV EDX, [EBX+EAX]  ;следующий символ
	;CMP EDX,0			
	;JNZ M2				;если символ не 0
	
	;POP EBP
	;RET
;END