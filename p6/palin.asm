data segment
	str1 db 'LIRIL'
	len equ $-str1
	str2 db 20 DUP(?)
	palin db 10,13,'String is a palindrome$'
	npalin db 10,13,'String is NOT a palindrome$'
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV DS, AX
	MOV ES, AX

	LEA SI, str1
	LEA DI, str2
	add DI, len-1

	mov CX, len

UP:
	LODSB
	STD
	STOSB
	CLD
	LOOP UP

	LEA SI, str1
	LEA DI, str2
	CLD
	MOV CX, len
	REPE CMPSB

	JZ PAL
	MOV DX, OFFSET npalin
	JMP EXIT
PAL:
	MOV DX, OFFSET palin
EXIT:
	MOV AH, 09H
	INT 21H

	MOV AH, 4CH
	INT 21H
	HLT
code ends
end start
