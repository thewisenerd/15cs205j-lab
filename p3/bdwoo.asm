data segment
	X DB 01H,02H,03H,04H,05H
	Y DB 05 DUP(0)
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV DS, AX			; point DS to data
	MOV ES, AX			; point ES to data

	LEA SI, X			; load SI = addr X
	LEA DI, Y			; load DI = addr Y
	MOV CX, 05H			; Load counter

	CLD					; clear direction flag
	REP MOVSB			; Move byte at address DS:SI to address ES:DI

	MOV AH, 4CH
	INT 21H
	HLT
code ends
end start
