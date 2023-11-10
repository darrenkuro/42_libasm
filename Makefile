_SRC	:=	ft_read.s ft_write.s ft_strlen.s ft_strcmp.s ft_strdup.s ft_strcpy.s \
			ft_atoi_base.s ft_list_push_front.s ft_list_remove_if.s ft_list_size.s \
			ft_list_sort.s
_TEST	:=	main.c

ifeq ($(shell uname -s), Darwin)
	SRCDIR	:=	src/arm64
	OBJDIR	:=	bin/arm64
	SRC		:=	$(addprefix $(SRCDIR)/, $(_SRC))
	OBJ		:=	$(addprefix $(OBJDIR)/, $(_SRC:.s=.o))
	AS		:=	as
	ASFLAGS	:=
else ifeq ($(shell uname -s), Linux)
	SRCDIR	:=	src/x86_64
	OBJDIR	:=	bin/x86_64
	SRC		:=	$(addprefix $(SRCDIR)/, $(_SRC))
	OBJ		:=	$(addprefix $(OBJDIR)/, $(_SRC:.s=.o))
	AS		:=	nasm
	ASFLAGS	:=	-f elf64
endif

LIBDIR	:=	lib

_NAME	:=	libasm.a
NAME	:=	$(addprefix $(LIBDIR)/, $(_NAME))

CC		:=	cc
CFLAGS	:=	-Wall -Wextra -Werror
AR		:=	ar rcs
RM		:=	rm -rf
LDFLAGS	:=	-L$(LIBDIR)
LDLIBS	:=	-lasm
MUTE	:=	>/dev/null

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
	@$(CC) $(CFLAGS) $(SRCDIR)/$(_TEST) $(LDFLAGS) $(LDLIBS) -o $@ $(MUTE)
	@./$@
	@$(RM) $@

mac:
	as -arch arm64 src/ft_write.s -o src/ft_write.o
	ar rcs $(NAME) src/ft_write.o
