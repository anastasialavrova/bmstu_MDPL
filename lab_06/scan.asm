PUBLIC SCAN

DSEG	SEGMENT PARA PUBLIC 'DATA'
		ENT		DB	'>> $'
		NLINE	DB	10, 13, '$'
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG
		
SCAN PROC NEAR
	MOV  AH, 9
	MOV  DX, OFFSET ENT
	INT  21H
	
	XOR  BX, BX ; BX = 0
	XOR  CX, CX ; CX = 0
	
	INPUT_LOOP:
		MOV  AH, 8
		INT  21H
		
		CMP  AL, 13 ;  check new line
		JE   INPUT_END
		
		CMP  AL, 45  ; check '-'
		JE   NEG_NUM
		
		CMP  AL, '0'  ; check  choice
		JB   INPUT_LOOP
		CMP  AL, '9'
		JA   INPUT_LOOP
		
		MOV  AH, 2
		MOV  DL, AL
		INT  21H
		
		MOV  CL, AL
		MOV  AX, BX

				; increase in discharge
		
		SHL  AX, 1 ; 2?
		SHL  AX, 1 ; 4?
		ADD  AX, BX ; +1 -> 5x
		SHL  AX, 1; 10x
		
		MOV  BL, CL
		SUB  BL, '0'
		XOR  BH, BH
		ADD  BX, AX
		
		JMP  INPUT_LOOP
		
	NEG_NUM:
		MOV  AH, 2
		MOV  DL, AL
		INT  21H
		
		MOV  CH, 1
		
		JMP  INPUT_LOOP
		
	INPUT_END:
		MOV  AH, 9
		MOV  DX, OFFSET NLINE
		INT  21H
		
		CMP  CH, 1
		JNE  SCAN_END
		
		NEG  BX ; change the signe og number
		
	SCAN_END:
		XOR  DH, DH
		MOV  DL, CH
		MOV  AX, BX
		
		RET
		
SCAN ENDP

CSEG	ENDS
END