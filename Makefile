_SRC	:=	ft_read.s ft_write.s ft_strlen.s ft_strcmp.s ft_strdup.s ft_strcpy.s \
			ft_atoi_base.s ft_list_push_front.s ft_list_remove_if.s ft_list_size.s \
			ft_list_sort.s
_TEST	:=	main.c

ifeq ($(shell uname -s), Darwin)
	SRCDIR	:=	src/arm64
	OBJDIR	:=	bin/arm64
	SRC		:=	$(addprefix $(SRCDIR)/, $(_SRC))
	OBJ		:=	$(addprefix $(OBJDIR)/, $(_SRC:.s=.o))
else ifeq ($(shell uname -s), Linux)
	SRCDIR	:=	src/x86_64
	OBJDIR	:=	bin/x86_64
	SRC		:=	$(addprefix $(SRCDIR)/, $(_SRC))
	OBJ		:=	$(addprefix $(OBJDIR)/, $(_SRC:.s=.o))
endif

LIBDIR	:=	lib

_NAME	:=	libasm.a
NAME	:=	$(addprefix $(LIBDIR)/, $(_NAME))

CC		:=	cc
CFLAGS	:=	-Wall -Wextra -Werror
AS		:=	nasm
ASFLAGS	:=	-f elf64
AR		:=	ar rcs
RM		:=	rm -rf
LDFLAGS	:=	-L$(LIBDIR) -lasm


# ifeq ($(shell uname -s), Darwin)
# 	SRC		:=	$(addprefix $(SRCDIR)/arm64/, $(_SRC))
# 	OBJ		:=	$(addprefix $(OBJDIR)/arm64/, $(_SRC:.s=.o))
# else ifeq ($(shell uname -s), Linux)
# 	SRC		:=	$(addprefix $(SRCDIR)/x86_64/, $(_SRC))
# 	OBJ		:=	$(addprefix $(OBJDIR)/x86_64/, $(_SRC:.s=.o))
# endif

.PHONY: all clean fclean re test

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $@ $^

$(OBJDIR)/%.o: $(SRCDIR)/%.s
	@mkdir -p $(OBJDIR) && cd $(OBJDIR)
	$(AS) $(ASFLAGS) $< -o $@

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

test: $(NAME)
	@$(CC) $(CFLAGS) $(SRCDIR)/$(_TEST) $(LDFLAGS) -o $@ >/dev/null
	@./$@
	@$(RM) $@

mac:
	as -arch arm64 src/ft_write.s -o src/ft_write.o
	ar rcs $(NAME) src/ft_write.o
