.XALL
.386
.model FLAT, C
PUBLIC m0
PUBLIC m1

TempMacro MACRO type, tname, List1, List2

A = 0

tname&:
	PUSH EBP
	MOV EBP, ESP
	FOR param, <List1>
	.LALL
		param textequ @catstr([EBP + %(8 + A*4)])
		.XALL
		A = A + 1
	ENDM
	IFB <LIST2>
		PUSH EBX
		PUSH ESI
		PUSH EDI
	ELSE
		B = 1
		FOR param, <List2>
		PUSH param
		@catstr(XX,%B) textequ <param>
		B = B + 1
		ENDM
	ENDIF

	.LALL
	IFIDN <type>,<INT>
		;MOV EAX, 
	ENDIF
	IFIDN <type>,<INT*>
		;MOV EAX, OFFSET X 
	ENDIF
	.XALL

	IFB <LIST2>
		POP EDI
		POP ESI
		POP EBX 
	ELSE
		B = B - 1
		WHILE B GT 0
			POP @catstr(XX,%B)
			B = B - 1
		ENDM
	ENDIF
		
		
	POP EBP
ENDM
.data
.code
m0:
	RET
	TempMacro INT, m1,<x,y>,<EBX, ESI>
END

Comment^
; Что должно быть в результате
m1:
PUSH EBP
MOV EBP, ESP
; = [EBP + 8]		     2			x textequ @catstr([EBP + %(8 + A*4)])
; = [EBP + 12]		     2			y textequ @catstr([EBP + %(8 + A*4)])
PUSH EBX ; @catstr(XX, 1) textequ <param>
PUSH ESI ; @catstr(XX, 2) textequ <param>

;Вставьте код сюда

;			     1		IFIDN <INT>,<INT>
;			     1			;MOV EAX, 
;			     1		ENDIF
;			     1		IFIDN <INT>,<INT*>
;			     1		ENDIF

POP @catstr(XX,%B) ; ESI = XX2
POP @catstr(XX,%B) ; EBX = XX1
POP EBP
RET
^
END