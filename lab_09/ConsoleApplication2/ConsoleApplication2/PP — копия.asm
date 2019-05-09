.686
.model FLAT, C

PUBLIC p1
PUBLIC p2
.CODE
p1:
	
		PUSH	EBP
		MOV		EBP, ESP			; go to current position in stack
		MOV		ECX, [EBP + 8]		; get N
		MOV		EBX, [EBP + 12]		; get address of NF

		CMP		ECX, 1				; if CX != 1
		JBE		RET_1				; CX <= 1
		 
		DEC		ECX					; CX--, because without it we get stackoverflow

		PUSH	EBX					; address of NF, result
		PUSH	ECX					; all numbers from N - 1 to 1
		CALL	P1					; in stack: 5 NF, 4 NF, 3 NF, 2 NF, 1 1, 0 NF, 1 1, NF = 1

		ADD		ESP, 8				; remove last 8 bytes from stack, EBX - 4 byte, ECX - 4 byte

		INC		ECX					; N
		MUL		ECX					; CX * AX = CX * NF

		MOV		DWORD PTR [EBX], EAX ; result
		JMP		EXIT

	RET_1:
		MOV	DWORD PTR [EBX], 1	; BX = 1, answer is in EBX

	EXIT:
		POP		EBP
		RET

p2:
	PUSH EBP
	MOV	EBP, ESP
	MOV EAX, 1
	MOV	ECX, [EBP + 8] ; N
	MOV	EBX, [EBP + 12] ; NF adress
	CALL mm
	MOV	DWORD PTR [EBX], EAX
	POP EBP
	RET
mm:
	cmp ecx, 0
	JE reg_exit
	MUL ECX
	DEC ECX
	CALL mm
reg_exit:
	
	RET
END