.section .text
.global _ft_write

_ft_write:
	mov eax, 60
	mov ebx, 0
	syscall
