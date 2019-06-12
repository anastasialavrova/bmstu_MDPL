.386
.MODEL FLAT,C

PUBLIC CopyStr
.CODE
CopyStr:
	PUSH EBP
	MOV EBP,ESP
	PUSH ESI
	PUSH EDI

	MOV ESI, [EBP+8]   ;STR1
	MOV EDI, [EBP+12]  ;STR2
	MOV ECX, [EBP+16]  ;LEN ������ ������

	ADD ECX, ESI
	CMP ECX, EDI
	JAE M2

	;MOV EAX, EDI
	;CMP ESI, EDI        
	;JAE M1				; ���� ����� ������ ������ ������ ��� ����� ������, ������ ������ ����� ��� ������
	;JMP M2
M1:
	CLD					; ��������� ����� �� � ����
	REP MOVSB			; � ��� �������� ���, ��� �������� ������������� �� 1, 
	;��� �������� �� ���, ����� ��� ��������� ���������� � ���
	JMP EXIT
M2:
	SUB ECX, ESI
	STD					; ��������� �� � 1
	ADD ESI, ECX		; ������� � ����� ������
	DEC ESI				; ����� �� ��������� ������� � �� �� ����
	ADD EDI, ECX		; ������� � ����� ������
	DEC EDI				; ����� �� ��������� ������� � �� �� ����
	REP MOVSB			; � ��� �������� ���, ��� �������� ����������� �� 1, 
	;��� �������� �� ���, ����� ��� ��������� ���������� � ���

EXIT:
	POP EDI
	POP ESI
	POP EBP
	RET					; ������� ���������� ��������� �� ������ ������ ������
END