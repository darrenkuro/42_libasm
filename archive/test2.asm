global start

section .text

start:
	mov eax, 0x4 ; write
	mov ebx, 1
	mov ecx, msg
	mov edx, msg_len
	int 0x80	; invoke sys call
	mov eax, 0x1
	mov ebx, 0
	int 0x80


section .data
	msg: db "Hello World!", 0xA
	msg_len equ $-msg
