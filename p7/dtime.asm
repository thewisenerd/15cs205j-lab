data segment
	HOUR DB ?
	MIN DB ?
	SEC DB ?
	AMPM DB 0
	AMSTR DB 'AM',10,13,'$'
	PMSTR DB 'PM',10,13,'$'
data ends
code segment
assume cs:code, ds:data

dispnum macro
	MOV BX, AX
	MOV DL, BH
	ADD DL,30H		; ascii corrections
	MOV AH, 02H
	INT 21H
	MOV DL, BL
	ADD DL,30H		; ascii corrections
	MOV AH, 02H
	INT 21H
endm

dispchar macro ch
	mov ah, 02H
	mov dl, ch
	int 21H
endm

time proc
	MOV AH,2CH
	INT 21H
	MOV HOUR,CH
	MOV MIN,CL
	MOV SEC,DH

	; fix am/pm
	CMP HOUR, 12
	JB AM
	SUB HOUR, 12
	MOV AMPM, 1
AM:

	MOV AX, 0H
	MOV AL, HOUR
	AAM
	dispnum

	dispchar ':'

	MOV AX, 0H
	MOV AL, MIN
	AAM
	dispnum

	dispchar ':'

	MOV AX, 0H
	MOV AL, SEC
	AAM
	dispnum

	dispchar ' '
	CMP AMPM, 1
	JE PM
	LEA DX, AMSTR
	JMP ENDST
PM:
	LEA DX, PMSTR
ENDST:
	MOV AH, 09H
	INT 21H

	ret
endp

start:
	MOV AX, data
	MOV DS, AX

	call time
	MOV AH, 4CH
	INT 21H
	HLT

code ends
end start
