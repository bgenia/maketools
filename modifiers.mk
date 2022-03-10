# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    modifiers.mk                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/28 07:33:12 by bgenia            #+#    #+#              #
#    Updated: 2021/10/18 05:55:10 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifndef _MKT_MODIFIERS_MK_
_MKT_MODIFIERS_MK_ := 1

ifdef .DEFAULT_GOAL

_MKT_DEFAULT_GOAL := $(.DEFAULT_GOAL)

else

_MKT_DEFAULT_GOAL := all

endif

# (modifier)
define _MKT_apply_modifier =

export MODIFIERS[$1] := 1

.PHONY: $1

endef

$(eval $(foreach modifier,$(filter $(MODIFIERS),$(MAKECMDGOALS)),$(call _MKT_apply_modifier,$(modifier))))

# If there are only modifier targets, make one of them behave like the default one
ifeq ($(filter-out $(MODIFIERS),$(MAKECMDGOALS)),)

$(firstword $(filter $(MODIFIERS),$(MAKECMDGOALS))): $(_MKT_DEFAULT_GOAL)

endif

endif
