NAME	:=	libasm.a

.PHONY: test

test:
	nasm -f elf64 src/x86_64/ft_write.s -o src/ft_write.o
	nasm -f elf64 src/x86_64/ft_strcmp.s -o src/ft_strcmp.o
	ar rcs $(NAME) src/ft_write.o src/ft_strcmp.o

mac:
	as -arch arm64 src/ft_write.s -o src/ft_write.o
	ar rcs $(NAME) src/ft_write.o
