# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    colors.mk                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/01 03:07:00 by bgenia            #+#    #+#              #
#    Updated: 2021/09/05 16:52:04 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Control sequence introducer
_CSI := $(shell echo "\e[")

COLOR_RESET := $(_CSI)0m

COLOR_F_BLACK := $(_CSI)30m
COLOR_F_RED := $(_CSI)31m
COLOR_F_GREEN := $(_CSI)32m
COLOR_F_YELLOW := $(_CSI)33m
COLOR_F_BLUE := $(_CSI)34m
COLOR_F_MAGENTA := $(_CSI)35m
COLOR_F_CYAN := $(_CSI)36m
COLOR_F_WHITE := $(_CSI)37m

COLOR_F_LIGHT_BLACK := $(_CSI)30;1m
COLOR_F_LIGHT_RED := $(_CSI)31;1m
COLOR_F_LIGHT_GREEN := $(_CSI)32;1m
COLOR_F_LIGHT_YELLOW := $(_CSI)33;1m
COLOR_F_LIGHT_BLUE := $(_CSI)34;1m
COLOR_F_LIGHT_MAGENTA := $(_CSI)35;1m
COLOR_F_LIGHT_CYAN := $(_CSI)36;1m
COLOR_F_LIGHT_WHITE := $(_CSI)37;1m

COLOR_F_GREY := $(_CSI)30;1m
COLOR_F_GRAY := $(_CSI)30;1m

COLOR_F_DEFAULT := $(_CSI)39;1m

# (r, g, b) -> color_ecape_sequence
COLOR_F = $(_CSI)38;2;$1;$2;$3m

COLOR_B_BLACK := $(_CSI)40m
COLOR_B_RED := $(_CSI)41m
COLOR_B_GREEN := $(_CSI)42m
COLOR_B_YELLOW := $(_CSI)43m
COLOR_B_BLUE := $(_CSI)44m
COLOR_B_MAGENTA := $(_CSI)45m
COLOR_B_CYAN := $(_CSI)46m
COLOR_B_WHITE := $(_CSI)47m

COLOR_B_LIGHT_BLACK := $(_CSI)40;1m
COLOR_B_LIGHT_RED := $(_CSI)41;1m
COLOR_B_LIGHT_GREEN := $(_CSI)42;1m
COLOR_B_LIGHT_YELLOW := $(_CSI)43;1m
COLOR_B_LIGHT_BLUE := $(_CSI)44;1m
COLOR_B_LIGHT_MAGENTA := $(_CSI)45;1m
COLOR_B_LIGHT_CYAN := $(_CSI)46;1m
COLOR_B_LIGHT_WHITE := $(_CSI)47;1m

COLOR_B_GREY := $(_CSI)40;1m
COLOR_B_GRAY := $(_CSI)40;1m

COLOR_B_DEFAULT := $(_CSI)49;1m

# (r, g, b) -> color_ecape_sequence
COLOR_B = $(_CSI)48;2;$1;$2;$3m

STYLE_RESET := $(_CSI)0m

STYLE_BOLD := $(_CSI)1m
STYLE_FAINT := $(_CSI)2m
STYLE_ITALIC := $(_CSI)3m
STYLE_UNDERLINE := $(_CSI)4m
STYLE_BLINK_SLOW := $(_CSI)5m
STYLE_BLINK_FAST := $(_CSI)6m
STYLE_INVERT := $(_CSI)7m
STYLE_HIDE := $(_CSI)8m
STYLE_STRIKE := $(_CSI)9m

STYLE_NOT_BOLD := $(_CSI)21m
STYLE_NOT_FAINT := $(_CSI)22m
STYLE_NOT_ITALIC := $(_CSI)22m
STYLE_NOT_UNDERLINE := $(_CSI)24m
STYLE_NOT_BLINK := $(_CSI)25m
STYLE_NOT_INVERT := $(_CSI)27m
STYLE_NOT_HIDE := $(_CSI)28m
STYLE_NOT_STRIKE := $(_CSI)29m
