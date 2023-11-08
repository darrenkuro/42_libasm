global start

section .data
	msg: db "Hello World!", 0xA
	msg_len equ $-msg

section .text

start:
	mov rax, 0x2000004 ; write syscall number for 64-bit
	mov rdi, 1 ; file descriptor (stdout)
	mov rsi, msg ; message to write
	mov rdx, msg_len ; message length
	syscall ; invoke system call
	mov rax, 0x2000001 ; exit syscall number for 64-bit
	xor rdi, rdi ; exit code
	syscall ; invoke system call
