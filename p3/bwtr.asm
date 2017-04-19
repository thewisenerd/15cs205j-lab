data segment
	DATA1 DB 23H
	DATA2 DW 1234H
	DATA3 DB 0H
	DATA4 DW 0H
	DATA5 DW 2345H, 6789H, 4567H
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, DATA
	MOV DS, AX

	MOV AL, 25H				; copy 25H into 8 bit AL register
	MOV AX, 2345H			; copy 2345H into 16 bit AX register
	MOV BX, AX				; copy the content of AX into BX register (16-bit)
	MOV CL, AL				; copy the content of AL into CL register (8-bit)

	MOV AL, DATA1			; copies the byte contents of data segment memory 
							; location DATA1 into 8 bit AL

	MOV AX, DATA2			; copies the word contents of data segment memory
							; location DATA2 into 16 bit AX

	MOV DATA3, AL			; copies the AL content into the byte contents of data
							; segment memory location DATA3

	MOV DATA4, AX			; copies the AX content into the word contents of
							; data segment memory location DATA4

	MOV BX, OFFSET DATA5	; The 16 bit offset address of DS memeory location
							; DATA5 is copied into BX


	MOV AX, [BX]			; copies the word content of data segment
							; memory location addressed by BX into
							; AX(register indirect addressing)

	MOV DI, 02H				; address element
	MOV AX, [BX+DI]			; copies the word content of data segment
							; memory location addressed by BX+DI into
							; AX(base plus indirect addressing)

	MOV AX, [BX+02H]		; copies the word content of data segment (16 bit)

	MOV AL, [DI+02H]		; register relative addressing
	MOV AX, [BX+DI+02H]		; copies the word content of data segment
							; memory location addressed by BX+DI+0002H
							; into AX(16 bit)

	MOV AH, 4CH
	INT 21H
	HLT
code ends
end start
