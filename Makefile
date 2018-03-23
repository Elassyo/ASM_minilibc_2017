
##
## EPITECH PROJECT, 2018
## cpp_nanotekspice
## File description:
## Makefile
##

#
# OUTPUT
#

NAME		=	libasm.so

#
# SOURCES
#

SRC		=	memcpy.asm					\
			memmove.asm					\
			memset.asm					\
			rindex.asm					\
			strcasecmp.asm					\
			strchr.asm					\
			strcmp.asm					\
			strcspn.asm					\
			strlen.asm					\
			strncmp.asm					\
			strpbrk.asm					\
			strstr.asm					\
			bonus/exit.asm					\
			bonus/rand.asm					\
			bonus/read.asm					\
			bonus/write.asm

#
# PATHS
#

SRCDIR		=	src
OBJDIR		=	obj
SUBDIRS		=	bonus

#
# TESTS
#

TEST		=	test

TSTSRC		=	main.c						\
			tests_memcpy.c					\
			tests_memmove.c
TSTDIR		=	tests

#
# COMPILATION AND TOOLS
#

AS		=	nasm
CC		=	gcc
LD		=	ld

ASFLAGS		=	-f elf64 -Wall -Ox
LDFLAGS		=	-shared -fPIC

TSTCFLAGS	=	-W -Wall -Wextra -fno-builtin
TSTLDFLAGS	=

MKDIR		=	mkdir
RM		=	rm -rf

#
# OBJECTS
#

OBJ		=	$(SRC:.asm=.o)
TSTOBJ		=	$(TSTSRC:.c=.o)

#
# TARGETS
#

all: $(NAME)

$(NAME): $(addprefix $(OBJDIR)/, $(OBJ))
	$(LD) $^ $(LDFLAGS) -o $@

$(TEST): $(addprefix $(OBJDIR)/, $(OBJ) $(TSTOBJ))
	$(CC) $^ $(TSTLDFLAGS) -o $@

$(addprefix $(OBJDIR)/, $(OBJ)): $(OBJDIR)/%.o: $(SRCDIR)/%.asm | $(OBJDIR) $(addprefix $(OBJDIR)/, $(SUBDIRS))
	$(AS) $< $(ASFLAGS) -o $@

$(addprefix $(OBJDIR)/, $(TSTOBJ)): $(OBJDIR)/%.o: $(TSTDIR)/%.c | $(OBJDIR) $(addprefix $(OBJDIR)/, $(SUBDIRS))
	$(CC) -c $< $(TSTCFLAGS) -o $@

$(OBJDIR) $(addprefix $(OBJDIR)/, $(SUBDIRS)):
	$(MKDIR) $@

clean:
	$(RM) $(OBJDIR)

fclean: clean
	$(RM) $(NAME) $(TEST)

re: fclean all

.PHONY:	all clean fclean re
