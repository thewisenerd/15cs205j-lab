data segment
	X DB 01H,02H,03H,04H,05H
	Y DB 05 DUP(?)
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV DS, AX
	MOV ES, AX

	LEA SI, X+04H
	LEA DI, Y+02H
	MOV CX, 05H			; Load counter

UP:
	MOV BL, [SI]
	MOV [DI],BL
	DEC SI
	DEC DI
	LOOP UP

	MOV AH, 4CH
	INT 21H
	HLT
code ends
end start
