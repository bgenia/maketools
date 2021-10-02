# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    common_config.mk                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/28 04:16:07 by bgenia            #+#    #+#              #
#    Updated: 2021/10/02 03:24:41 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifndef _MKT_COMMON_CONFIG_MK_
_MKT_COMMON_CONFIG_MK_ := 1

# Make configuration

MAKEFLAGS += -j

.DEFAULT_GOAL = all

# Project structure configuration

NAME =

SRC_DIR = src
OBJ_DIR = build/obj
LIB_DIR = lib
BIN_DIR = .

INCLUDE = include

# Automatic project variables

BINS = $(foreach name_var,$(filter NAME%,$(.VARIABLES)),$($(name_var)))

# Compiler configuration

CC = clang

CFLAGS = -Wall -Werror -Wextra -MMD
CPPFLAGS = $(addprefix -I,$(INCLUDE)) $(addprefix -I,$(LIBINCLUDES))
LDFLAGS = $(LIBLDFLAGS)
LDLIBS = $(LIBLDLIBS)

# Modifer targets

_MKT_MODIFIER_TARGETS := debug sanitize serial

# If there are only modifier targets, make one of them behave like the default one
ifeq ($(filter-out $(_MKT_MODIFIER_TARGETS),$(MAKECMDGOALS)),)

$(firstword $(filter $(_MKT_MODIFIER_TARGETS),$(MAKECMDGOALS))): $(.DEFAULT_GOAL)

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

endif
