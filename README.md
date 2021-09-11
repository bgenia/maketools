# Maketools
Makefile utils for building C projects.

## Contents
+ [add_library](#add_library)
+ [colors](#colors)
+ [source_list](#source_list)

## add_library

Provides `add_library(path, include, linker flags)` function.

```Makefile
include maketools/add_library.mk

NAME = maketools-test

SRC_DIR := src
OBJ_DIR := build/obj
BIN_DIR := .

$(call add_library,lib/libft/libft.a,lib/libft/include)

INCLUDE := include
INCLUDE += $(LIBINCLUDES)

SRC := $(wildcard $(SRC_DIR)/*.c)
OBJ := $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

CC := clang

CFLAGS :=
CPPFLAGS := -Wall -Werror -Wextra $(addprefix -I,$(INCLUDE))
LDFLAGS :=
LDLIBS := $(LIBFLAGS)

.DEFAULT_GOAL := all
.PHONY: all
all: $(LIBS)
	$(MAKE) $(NAME)

$(NAME): $(OBJ) | $(BIN_DIR)
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

$(BIN_DIR) $(OBJ_DIR):
	mkdir -p $@
```
[Back to top](#maketools)

## colors

Provides variables and functions for terminal colors and text styles.

```Makefile
include maketools/colors.mk

$(info Boring white text)

$(info $(COLOR_F_RED)$(COLOR_B_GREEN)Fancy colored text$(COLOR_RESET))

$(warning $(call COLOR_F,255,125,0)Even more fancy RGB colored warning$(COLOR_RESET))
```
[Back to top](#maketools)

## source_list
An utility for generating source lists.

> Requires .ONESHELL, bash 4+

```Makefile
include maketools/source_list.mk

# (makefile, variable name, directory)
$(call source_list,sources.mk,SRC_LIST,src)

$(info SRC_LIST = $(SRC_LIST))
```
[Back to top](#maketools)
