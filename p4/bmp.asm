data segment
	NUM DB 12H
	POSM DB 10,13,'Data is Positive$'
	NEGM DB 10,13,'Data is Negative$'
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX,data
	MOV DS,AX

	MOV AL, NUM
	ROL AL, 1
	JC NEGA
	MOV DX, OFFSET POSM
	JMP EXIT
NEGA:
	MOV DX, OFFSET NEGM
EXIT:
	MOV AH, 09H
	INT 21H

	MOV AH, 4CH
	INT 21H
	HLT
code ends
end start
