# Maketools
Makefile utils for building C projects.

## add_library

Provides `add_library(path, include, linker flags)` function.

```Makefile
include maketools/add_library.mk

$(call add_library, lib/libft/libft.a, lib/libft/include)
$(call add_library, lib/libmlx/libmlx.a, lib/libmlx, -L/usr/lib -lXext -lX11 -lm -lz)

SRC := $(wildcard *.c)
OBJ := $(SRC:.c=.o)

INCLUDE := include
INCLUDE += $(LIBINCLUDE)

all: $(LIBS)
	$(MAKE) $(NAME)

$(NAME): $(OBJ)
	$(CC) $(filter-out $(LIBS),$^) -o $(NAME) $(LIBFLAGS)

%.o: %.c
	$(CC) -c $< -o $(NAME) $(addprefix -I,$(INCLUDE))
```

## colors

Provides variables for terminal colors and text styles.
