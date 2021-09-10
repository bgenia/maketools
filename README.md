# Maketools
Makefile utils for building C projects.

## Contents
+ [add_library](#add_library)
+ [colors](#colors)
+ [map](#map)
+ [create_source_list.sh](#create_source_list.sh)

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

# map
General-purpose map (associative array) functions

```Makefile
include maketools/map.mk

$(call map_set,MY_MAP,a,10)

$(call map_set,MY_MAP,b,20)
$(call map_add,MY_MAP,b,42)

$(info MY_MAP[a] = $(MY_MAP[a]))
$(info MY_MAP[b] = $(MY_MAP[b]))
$(info MY_MAP keys: $(MY_MAP))
$(info MY_MAP: $(call map_stringify,MY_MAP))
```
[Back to top](#maketools)

## create_source_list.sh
A bash utility for generating source lists (Requires bash 4+).

```bash
source maketools/create_source_list.sh

# variable = directory
source_map=(
	["SRC_LIST"]="src"
)

create_source_list "sources.mk"
```
```bash
source maketools/create_source_list.sh

source_map=(
	["SRC_LIST_SERVER"]="src/server"
	["SRC_LIST_CLIENT"]="src/client"
)

create_source_list "sources.mk"

source_map=(
	["SOMETHING_ELSE"]="other"
)

create_source_list "other.mk"
```
[Back to top](#maketools)
