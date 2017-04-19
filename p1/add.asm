data segment
	N1 DW 1234H
	N2 DW 2134H
	RES DW ?
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV DS, AX

	MOV AX, N1
	MOV BX, N2
	ADD AX, BX
	MOV RES, AX
	MOV AH, 4CH
	INT 21H
	HLT
code ends
end start
