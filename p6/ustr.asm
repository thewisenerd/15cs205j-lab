data segment
	INKEY DB ?
	BUF DB 10               ; max char allowed by user: 9
		DB ?                ; no. of char entered by user
		DB 10 DUP (?)       ; characters entered by user
	MES DB 10,13,'SRM UNIVERSITY$'
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV DS, AX

	; read one char
	MOV AH, 01H
	INT 21H
	MOV INKEY, AL

	; read buffered input
	MOV AH, 0AH
	LEA DX, BUF
	INT 21H

	; display character
	MOV AH, 06H
	MOV DL, 'Z'
	INT 21H

	; display string
	MOV AH, 09H
	LEA DX, MES
	INT 21H
code ends
end start
