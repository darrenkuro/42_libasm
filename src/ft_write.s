section .text
global ft_write

ft_write:
	mov eax, 60
	mov ebx, 0
	syscall
