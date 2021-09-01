# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    colors.mk                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/01 03:07:00 by bgenia            #+#    #+#              #
#    Updated: 2021/09/01 03:28:21 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COLOR_RESET := \e[0m

COLOR_F_BLACK := \e[30m
COLOR_F_RED := \e[31m
COLOR_F_GREEN := \e[32m
COLOR_F_YELLOW := \e[33m
COLOR_F_BLUE := \e[34m
COLOR_F_MAGENTA := \e[35m
COLOR_F_CYAN := \e[36m
COLOR_F_WHITE := \e[37m

COLOR_F_LIGHT_BLACK := \e[30;1m
COLOR_F_LIGHT_RED := \e[31;1m
COLOR_F_LIGHT_GREEN := \e[32;1m
COLOR_F_LIGHT_YELLOW := \e[33;1m
COLOR_F_LIGHT_BLUE := \e[34;1m
COLOR_F_LIGHT_MAGENTA := \e[35;1m
COLOR_F_LIGHT_CYAN := \e[36;1m
COLOR_F_LIGHT_WHITE := \e[37;1m

COLOR_F_GREY := \e[30;1m
COLOR_F_GRAY := \e[30;1m

COLOR_F_DEFAULT := \e[39;1m

COLOR_B_BLACK := \e[40m
COLOR_B_RED := \e[41m
COLOR_B_GREEN := \e[42m
COLOR_B_YELLOW := \e[43m
COLOR_B_BLUE := \e[44m
COLOR_B_MAGENTA := \e[45m
COLOR_B_CYAN := \e[46m
COLOR_B_WHITE := \e[47m

COLOR_B_LIGHT_BLACK := \e[40;1m
COLOR_B_LIGHT_RED := \e[41;1m
COLOR_B_LIGHT_GREEN := \e[42;1m
COLOR_B_LIGHT_YELLOW := \e[43;1m
COLOR_B_LIGHT_BLUE := \e[44;1m
COLOR_B_LIGHT_MAGENTA := \e[45;1m
COLOR_B_LIGHT_CYAN := \e[46;1m
COLOR_B_LIGHT_WHITE := \e[47;1m

COLOR_B_GREY := \e[40;1m
COLOR_B_GRAY := \e[40;1m

COLOR_B_DEFAULT := \e[49;1m

STYLE_RESET := \e[0m

STYLE_BOLD := \e[1m
STYLE_FAINT := \e[2m
STYLE_ITALIC := \e[3m
STYLE_UNDERLINE := \e[4m
STYLE_BLINK_SLOW := \e[5m
STYLE_BLINK_FAST := \e[6m
STYLE_INVERT := \e[7m
STYLE_HIDE := \e[8m
STYLE_STRIKE := \e[9m

STYLE_NOT_BOLD := \e[21m
STYLE_NOT_FAINT := \e[22m
STYLE_NOT_ITALIC := \e[22m
STYLE_NOT_UNDERLINE := \e[24m
STYLE_NOT_BLINK := \e[25m
STYLE_NOT_INVERT := \e[27m
STYLE_NOT_HIDE := \e[28m
STYLE_NOT_STRIKE := \e[29m
