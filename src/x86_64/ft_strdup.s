section	.text
global	ft_strdup
extern	ft_strlen
extern	ft_strcpy
extern	malloc

ft_strdup:
	push	rdi
	call	ft_strlen
	inc		rax			; add null character space
	mov		rdi, rax
	call	malloc
	cmp		rax, 0
	je		fail
	mov		rdi, rax
	pop		rsi
	call	ft_strcpy
	ret

fail:
	mov		rax, 0
	ret
