# Maketools
Makefile utils for building C projects.

## Contents
+ [common_config/common_rules](#common_configcommon_rules)
+ [add_library](#add_library)
+ [termdefs](#termdefs)
+ [source_list](#source_list)
+ [map](#map)
+ [utils](#utils)

## common_config/common_rules

Provides plenty of common make variables, rules and modifiers.

Example Makefile for C project using common_config/common_rules:
```Makefile
include maketools/common_config.mk
include maketools/source_list.mk
include maketools/add_library.mk

NAME := sample

$(call add_library,lib/libft/libft.a,lib/libft/include)

$(call source_list,sources.mk,SRC,src)

OBJ := $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

$(NAME): $(OBJ)

include maketools/common_rules.mk
```

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

## termdefs

Provides variables and functions for terminal colors and text styles.

```Makefile
include maketools/termdefs.mk

$(info Boring white text)

$(info $(COLOR_F_RED)$(COLOR_B_GREEN)Fancy colored text$(COLOR_RESET))

$(warning $(call COLOR_F,255,125,0)Even more fancy RGB colored warning$(COLOR_RESET))
```
[Back to top](#maketools)

## source_list
An utility for generating source lists.

```Makefile
include maketools/source_list.mk

# (makefile, variable name, directory)
$(call source_list,sources.mk,SRC_LIST,src)

$(info SRC_LIST = $(SRC_LIST))
```
```Makefile
include maketools/source_list.mk

# (makefile, variable name, sources)
$(call source_list_of,sources.mk,SRC_LIST,$(shell find src -type f -name '*.c'))

$(info SRC_LIST = $(SRC_LIST))
```
[Back to top](#maketools)

## map
Map (associative arrays) support with bash-like syntax.

```Makefile
$(call declare_map,MY_MAP)

MY_MAP[a] = 1						# Set values
MY_MAP[b] = 2

$(info MY_MAP[a] = $(MY_MAP[a]))	# Get values
$(info MY_MAP[b] = $(MY_MAP[b]))
$(info MY_MAP values: $(MY_MAP[@]))	# Get all values
$(info MY_MAP keys: $(!MY_MAP[@]))	# Get all keys
$(info MY_MAP: $(MY_MAP))			# Get string representation (key-value pairs)
```

Also supports nested maps!

```Makefile
include maketools/map.mk

$(call declare_map,MY_MAP)

MY_MAP[a] := 1
MY_MAP[b] := 2

$(call declare_map,MY_MAP[c])

MY_MAP[c][x] := 10
MY_MAP[c][y] := 20

$(call declare_map,MY_MAP[c][z])

MY_MAP[c][z][key] := 21
MY_MAP[c][z][key] += 42

$(info $(MY_MAP))
$(info $(MY_MAP[c]))
$(info $(MY_MAP[c][@]))
$(info $(!MY_MAP[c][z][@]))
```

`declare_map` is used to define keys/values syntax, but you can use map functions instead:

```Makefile
include maketools/map.mk

MY_MAP[a] := 1
MY_MAP[b] := 2

MY_MAP[c][x] := 10
MY_MAP[c][y] := 20

MY_MAP[c][z][key] := 21
MY_MAP[c][z][key] += 42

$(info $(call map_serialize,MY_MAP))
$(info $(call map_serialize,MY_MAP[c]))
$(info $(call map_values,MY_MAP[c]))
$(info $(call map_keys,MY_MAP[c][z]))
```

[Back to top](#maketools)

## utils
Utility functions:
+ `map`
+ `reduce`
+ `reduce_right`
+ `tail`
+ `chop`

[Back to top](#maketools)
