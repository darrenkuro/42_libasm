NAME	:=	libasm.a

test:
	nasm -f elf64 src/ft_write.s -o src/ft_write.o
	ar rcs $(NAME) src/ft_write.o
