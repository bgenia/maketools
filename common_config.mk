# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    common_config.mk                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/28 04:16:07 by bgenia            #+#    #+#              #
#    Updated: 2022/04/26 14:00:49 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifndef _MKT_COMMON_CONFIG_MK_
_MKT_COMMON_CONFIG_MK_ := 1

# Make configuration

MAKEFLAGS += -j --output-sync=recurse --no-print-directory

.DEFAULT_GOAL = all

# Project structure configuration

NAME =

SRC_DIR = src
OBJ_DIR = build/obj
LIB_DIR = lib
BIN_DIR = .

INCLUDE = include

LANGUAGE = C
SRC_EXT = $(if $(filter C,$(LANGUAGE)),c)$(if $(filter CXX,$(LANGUAGE)),cpp)

# Automatic project variables

BINS = $(foreach name_var,$(filter NAME%,$(.VARIABLES)),$($(name_var)))

# Compiler configuration

CC = clang
CFLAGS = -Wall -Werror -Wextra -MMD

CXX = clang++
CXXFLAGS = -Wall -Werror -Werror -std=c++98

CPPFLAGS = $(addprefix -I,$(INCLUDE)) $(addprefix -I,$(LIBINCLUDES))

LDFLAGS = $(LIBLDFLAGS)
LDLIBS = $(LIBLDLIBS)

# Modifer targets

_MKT_MODIFIER_TARGETS := bonus debug sanitize serial

# If there are only modifier targets, make one of them behave like the default one
ifeq ($(filter-out $(_MKT_MODIFIER_TARGETS),$(MAKECMDGOALS)),)
    $(firstword $(filter $(_MKT_MODIFIER_TARGETS),$(MAKECMDGOALS))): $(.DEFAULT_GOAL)
endif

# Bonus modifier target

.PHONY: bonus

ifneq ($(filter bonus,$(MAKECMDGOALS)),)
    export BONUS_MODE := 1
endif

# Debug modifier target

.PHONY: debug

ifneq ($(filter debug,$(MAKECMDGOALS)),)
    export DEBUG_MODE := 1
endif

ifdef DEBUG_MODE
    CFLAGS += -g
    CPPFLAGS += -DDEBUG
else
    CFLAGS += -O2
    CPPFLAGS += -DNDEBUG
endif

# Sanitize modifier target

.PHONY: sanitize

ifneq ($(filter sanitize,$(MAKECMDGOALS)),)
    export SANITIZE_MODE := 1
endif

ifdef SANITIZE_MODE
    LDFLAGS += -fsanitize=address
endif

# Serial modifier target

.PHONY: serial

ifneq ($(filter serial,$(MAKECMDGOALS)),)
    .NOTPARALLEL:
endif

# Help target

define _MKT_COMMON_HELP_MESSAGE =
Default build target:
    all         - Build the project

Binary build targets:
    $(BINS)

Modifier targets:
    bonus       - Build in bonus mode
    debug       - Build in debug mode
    sanitize    - Link address sanitizer
    serial      - Disable parralel build

    ! A modifier target must be used together with
      a build target or without any non-modifier targets

Utility targets:
    clean       - Clean temporary build files
    fclean      - Clean target files & temporary build files
    re          - Rebuild the project (modifiers allowed)
    cleanlibs   - Run clean for all libraries
    fcleanlibs  - Run fclean for all libraries
    relibs      - Rebuild all libraries
    help        - Display this message

endef

.PHONY: help

help:
	$(info $(or $(.HELP_MESSAGE),$(_MKT_COMMON_HELP_MESSAGE)))

endif
