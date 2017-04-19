data segment
	N1 dw 5H
	RES dw ?
data ends
code segment
assume cs:code, ds:data
start:
	mov ax, data
	mov DS, Ax

	mov ax, 1H
	mov cx, N1
up:
	mul cx
	loop up
	mov RES, ax

	MOV AH, 4CH
	int 21H
	HLT
code ends
end start
