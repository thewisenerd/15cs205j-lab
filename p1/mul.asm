data segment
	OPR1 DW 1234H
	OPR2 DW 0002H
	RESLW DW ?
	RESHW DW ?
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV DS, AX

	MOV AX, OPR1
	MUL OPR2
	MOV RESLW, AX
	MOV RESHW, DX
	MOV AH, 4CH
	INT 21H
	HLT
code ends
end start
