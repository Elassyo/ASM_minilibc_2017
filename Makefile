
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
			strstr.asm

#
# PATHS
#

SRCDIR		=	src
OBJDIR		=	obj

#
# COMPILATION AND TOOLS
#

AS		=	nasm
LD		=	ld

ASFLAGS		=	-f elf64 -Wall -Ox
LDFLAGS		=	-shared -fPIC

MKDIR		=	mkdir
RM		=	rm -rf

#
# OBJECTS
#

OBJ		=	$(SRC:.asm=.o)

#
# TARGETS
#

all: $(NAME)

$(NAME): $(addprefix $(OBJDIR)/, $(OBJ))
	$(LD) $^ $(LDFLAGS) -o $@

$(addprefix $(OBJDIR)/, $(OBJ)): $(OBJDIR)/%.o: $(SRCDIR)/%.asm $(addprefix $(INCDIR)/, $(INC)) | $(OBJDIR)
	$(AS) $< $(ASFLAGS) -o $@

$(OBJDIR):
	$(MKDIR) $@

clean:
	$(RM) $(OBJDIR) $(TESTOBJDIR)

fclean: clean
	$(RM) $(NAME) $(TESTNAME)

re: fclean all

.PHONY:	all clean fclean re
