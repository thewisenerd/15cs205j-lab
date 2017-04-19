data segment
	OPR1 DW 2C58H
	OPR2 DW 56H
	RESQ DB ?
	RESR DB ?
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV DS, AX

	MOV AX, OPR1
	DIV OPR2
	MOV RESQ, AL
	MOV RESR, AH
	MOV AH, 4CH
	INT 21H
	HLT
code ends
end start
