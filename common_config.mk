# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    common_config.mk                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/28 04:16:07 by bgenia            #+#    #+#              #
#    Updated: 2022/03/10 13:35:59 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifndef _MKT_COMMON_CONFIG_MK_
_MKT_COMMON_CONFIG_MK_ := 1

# Make configuration

MAKEFLAGS += -j

.DEFAULT_GOAL := all

# Project structure configuration

NAME =

SRC_DIR := src
OBJ_DIR := build/obj
LIB_DIR := lib
BIN_DIR := .

INCLUDE := include

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

_MKT_MODIFIER_TARGETS := debug sanitize

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

# Clean utility target

.PHONY: clean

clean:
	$(RM) -f $(OBJ_DIR)/*

# Fclean utility target

.PHONY: fclean

fclean: clean
	$(RM) -f $(BINS)

# Re utility target

.PHONY: re

re: fclean
	$(MAKE)

# Cleanlibs utility target

.PHONY: cleanlibs

cleanlibs: $(foreach lib,$(LIBS),$(lib)_clean)

# Fcleanlibs utility target

.PHONY: fcleanlibs

fcleanlibs: $(foreach lib,$(LIBS),$(lib)_fclean)

# Relibs utility target

.PHONY: relibs

relibs: $(foreach lib,$(LIBS),$(lib)_re)

endif
