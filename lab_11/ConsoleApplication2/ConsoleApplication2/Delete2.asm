.386
.model FLAT, C

public DelProbel2

.code
DelProbel2 PROC
	PUSH EBP
	MOV EBP, ESP
	PUSH EDI
	MOV EDI, [EBP + 8] ; ������
	MOV EBX, EDI
	MOV EAX, 0
	MOV ECX, 0 ; �������
	MOV CX, -1
	MOV AL, ' '
	CLD ; ����� ����� ����������� df=0
	REPE SCASB ; ������������� ������ �� ���������� � ��� ������������� �������� ����� �� AL
	MOV ESI, EDI
	DEC ESI
	MOV AL, 0
	MOV CX, -1
	REPNE SCASB ; �� ����� ������ (���� �� ����� ��� �� ����)
	NEG CX
	SUB EDI, 2 ; ����� scasb ������ �� 2 ������� ������, ��� ����
	MOV AL, ' '
	STD ; df=1
	REPE SCASB ; ������� �� ������� ������������� ������ (���� ����� ��� 0)
	MOV AX, CX
	MOV EDI, EBX
	CLD
	REP MOVSB ; � edi �������� esi, ��� �������� ������������� �� 1
	MOV CX, 0
	MOV [EDI], CX
	POP EDI
	POP EBP
	RET
DelProbel2 ENDP
END