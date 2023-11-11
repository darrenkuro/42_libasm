section .text
global ft_strcpy

ft_strcpy:
	xor		rax, rax
	push	rdi

copy:
	mov		al, byte [rsi]
	mov		byte [rdi], al
	cmp		al, 0
	je		return
	inc		rsi
	inc		rdi
	jmp		copy

return:
	pop		rax
	ret
