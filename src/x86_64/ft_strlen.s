section .text
global ft_strlen

ft_strlen:
	xor		rax, rax			; set rax to 0

check:
	cmp 	BTYE [rdi + rax], 0
	je		return
	inc 	rax
	jmp		check

return:
	ret
