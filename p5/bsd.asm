data segment
arr db 5h,7h,11h,4h,10h,09h
len db $-arr
data ends

code segment
	assume cs:code, ds:data
start:
	mov ax,data
	mov ds,ax

	mov cl,len
	sub cl,1
lp1:
	mov bx,cx
	lea si,arr
lp2:
	mov al,[si]
	inc si
	mov dl,[si]
	cmp dl,al

	jb lp3
	xchg [si],al
	mov [si-1],al
lp3:
	dec bx
	jnz lp2
	loop lp1

	mov ah,4ch
	int 21h
end start
