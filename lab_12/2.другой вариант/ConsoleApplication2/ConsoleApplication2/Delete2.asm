.386
.model FLAT, C

public DelProbel2

.code
DelProbel2 PROC
	PUSH EBP
	MOV EBP, ESP
	PUSH EDI
	MOV EDI, [EBP + 8] ; строка
	MOV EBX, EDI
	MOV EAX, 0
	MOV ECX, 0 ; счетчик
	MOV CX, -1
	MOV AL, ' '
	CLD ; сброс флага направлениЯ df=0
	REPE SCASB ; просматриваем строку на нахождение в ней определенного значениЯ байта из AL
	MOV ESI, EDI
	DEC ESI
	MOV AL, 0
	MOV CX, -1
	REPNE SCASB ; до конца строки (пока не равно или не ноль)
	NEG CX
	SUB EDI, 2 ; после scasb уходит на 2 символа больше, чем надо
	MOV AL, ' '
	STD ; df=1
	REPE SCASB ; доходим до первого непробельного справа (пока равно или 0)
	MOV AX, CX
	MOV EDI, EBX
	CLD
	REP MOVSB ; в edi кладется esi, оба регистра увеличиваютсЯ на 1
	MOV CX, 0
	MOV [EDI], CX
	POP EDI
	POP EBP
	RET
DelProbel2 ENDP
END