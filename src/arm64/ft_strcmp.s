section .text
global	ft_strcmp

ft_strcmp:
	xor	rax, rax

compare:
	mov	al, byte [rdi]
	mov ah, byte [rsi]
	cmp	al, ah
	jl	return_lesser
	jg	return_greater
	cmp byte [rdi], 0
	je	return_zero
	inc	rdi
	inc rsi
	jmp	compare

return_lesser:
	mov	rax, -1
	ret

return_greater:
	mov rax, 1
	ret

return_zero:
	xor	rax, rax
	ret
