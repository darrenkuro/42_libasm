NAME	:=	libasm.a

.PHONY: test

test:
	nasm -f elf64 src/x86_64/ft_write.s -o src/ft_write.o
	ar rcs $(NAME) src/ft_write.o

mac:
	as -arch arm64 src/ft_write.s -o src/ft_write.o
	ar rcs $(NAME) src/ft_write.o
