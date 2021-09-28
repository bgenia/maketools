# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    termdefs.mk                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/01 03:07:00 by bgenia            #+#    #+#              #
#    Updated: 2021/09/28 04:58:47 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifndef _MKT_TERMDEFS_MK_
_MKT_TERMDEFS_MK_ := 1

# Control sequence introducer
TERM_CSI := $(shell echo "\e[")

TERM_RESET := $(TERM_CSI)0m

COLOR_F_BLACK := $(TERM_CSI)30m
COLOR_F_RED := $(TERM_CSI)31m
COLOR_F_GREEN := $(TERM_CSI)32m
COLOR_F_YELLOW := $(TERM_CSI)33m
COLOR_F_BLUE := $(TERM_CSI)34m
COLOR_F_MAGENTA := $(TERM_CSI)35m
COLOR_F_CYAN := $(TERM_CSI)36m
COLOR_F_WHITE := $(TERM_CSI)37m

COLOR_F_LIGHT_BLACK := $(TERM_CSI)30;1m
COLOR_F_LIGHT_RED := $(TERM_CSI)31;1m
COLOR_F_LIGHT_GREEN := $(TERM_CSI)32;1m
COLOR_F_LIGHT_YELLOW := $(TERM_CSI)33;1m
COLOR_F_LIGHT_BLUE := $(TERM_CSI)34;1m
COLOR_F_LIGHT_MAGENTA := $(TERM_CSI)35;1m
COLOR_F_LIGHT_CYAN := $(TERM_CSI)36;1m
COLOR_F_LIGHT_WHITE := $(TERM_CSI)37;1m

COLOR_F_GREY := $(TERM_CSI)30;1m
COLOR_F_GRAY := $(TERM_CSI)30;1m

COLOR_F_DEFAULT := $(TERM_CSI)39;1m

# (r, g, b) -> color_ecape_sequence
COLOR_F = $(TERM_CSI)38;2;$1;$2;$3m

COLOR_B_BLACK := $(TERM_CSI)40m
COLOR_B_RED := $(TERM_CSI)41m
COLOR_B_GREEN := $(TERM_CSI)42m
COLOR_B_YELLOW := $(TERM_CSI)43m
COLOR_B_BLUE := $(TERM_CSI)44m
COLOR_B_MAGENTA := $(TERM_CSI)45m
COLOR_B_CYAN := $(TERM_CSI)46m
COLOR_B_WHITE := $(TERM_CSI)47m

COLOR_B_LIGHT_BLACK := $(TERM_CSI)40;1m
COLOR_B_LIGHT_RED := $(TERM_CSI)41;1m
COLOR_B_LIGHT_GREEN := $(TERM_CSI)42;1m
COLOR_B_LIGHT_YELLOW := $(TERM_CSI)43;1m
COLOR_B_LIGHT_BLUE := $(TERM_CSI)44;1m
COLOR_B_LIGHT_MAGENTA := $(TERM_CSI)45;1m
COLOR_B_LIGHT_CYAN := $(TERM_CSI)46;1m
COLOR_B_LIGHT_WHITE := $(TERM_CSI)47;1m

COLOR_B_GREY := $(TERM_CSI)40;1m
COLOR_B_GRAY := $(TERM_CSI)40;1m

COLOR_B_DEFAULT := $(TERM_CSI)49;1m

# (r, g, b) -> color_ecape_sequence
COLOR_B = $(TERM_CSI)48;2;$1;$2;$3m

STYLE_BOLD := $(TERM_CSI)1m
STYLE_FAINT := $(TERM_CSI)2m
STYLE_ITALIC := $(TERM_CSI)3m
STYLE_UNDERLINE := $(TERM_CSI)4m
STYLE_BLINK_SLOW := $(TERM_CSI)5m
STYLE_BLINK_FAST := $(TERM_CSI)6m
STYLE_INVERT := $(TERM_CSI)7m
STYLE_HIDE := $(TERM_CSI)8m
STYLE_STRIKE := $(TERM_CSI)9m

STYLE_NOT_BOLD := $(TERM_CSI)21m
STYLE_NOT_FAINT := $(TERM_CSI)22m
STYLE_NOT_ITALIC := $(TERM_CSI)22m
STYLE_NOT_UNDERLINE := $(TERM_CSI)24m
STYLE_NOT_BLINK := $(TERM_CSI)25m
STYLE_NOT_INVERT := $(TERM_CSI)27m
STYLE_NOT_HIDE := $(TERM_CSI)28m
STYLE_NOT_STRIKE := $(TERM_CSI)29m

endif
