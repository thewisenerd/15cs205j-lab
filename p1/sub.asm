data segment
	N1 DW 4444H
	N2 DW 2121H
	RES DW ?
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV DS, AX

	MOV AX, N1
	MOV BX, N2
	SUB AX, BX
	MOV RES, AX
	MOV AH, 4CH
	INT 21H
	HLT
code ends
end start
