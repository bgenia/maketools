# Maketools
Makefile utils for building C projects.

## Contents
+ [common_config/common_rules](#common_configcommon_rules)
+ [add_library](#add_library)
+ [add_libraries](#add_libraries)
+ [termdefs](#termdefs)
+ [source_list](#source_list)
+ [map](#map)
+ [utils](#utils)
+ [modifiers](#modifiers)

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

all: $(NAME)

$(NAME): $(OBJ)

include maketools/common_rules.mk
```

[Back to top](#maketools)

## add_library

Provides `add_library(path, include, make flags)` function.

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

## add_libraries
Provides a more convinient interface for `add_library`.

```Makefile
define .LIBRARIES
lib/libft/libft.a:lib/libft/include:debug
lib/libmlx/libmlx.a:lib/libmlx
lib/libsample/libsample.a:lib/libsample/include
endef
include maketools/add_libraries.mk

# Equivalent to
$(call add_library,lib/libft/libft.a,lib/libft/include,debug)
$(call add_library,lib/libmlx/libmlx.a,lib/libmlx)
$(call add_library,lib/libsample/libsample.a,lib/libsample/include)
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

# (directory)
SRC = $(call source_list,src)

$(info SRC = $(SRC))
```
```Makefile
include maketools/source_list.mk

# (sources)
SRC = $(call source_list_of,$(shell find src -type f -name '*.c'))

$(info SRC = $(SRC))
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

## modifiers
A more generalized standalone version of modifiers from `common_config`.
Modifiers are fake make targets that define special variables if used in make cmd args.

Example with `debug` and `sanitize` modifiers:
```Makefile
MODIFIERS := debug sanitize

include maketools/modifiers.mk

ifdef MODIFIERS[debug]

CPPFLAGS += -g

endif

ifdef MODIFIERS[sanitize]

LDFLAGS += fsanitize=address

endif

# ...

all bonus: $(NAME)

# ...
```

Now we can use make as follows:
```bash
make all debug				# make all      | debug
make all debug sanitize		# make all      | debug, sanitize
make debug					# make all      | debug, sanitize
make bonus debug santize	# make bonus    | debug, sanitize
make sanitize bonus	-j		# make bonus -j | debug, sanitize
```

If no non-modifier targets are provided, `.DEFAULT_GOAL` or `all` will be used.

[Back to top](#maketools)
