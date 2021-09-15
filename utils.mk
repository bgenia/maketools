# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    utils.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/11 23:58:28 by bgenia            #+#    #+#              #
#    Updated: 2021/09/15 04:56:12 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# (list) -> list
tail = $(wordlist 2,$(words $1),$1)

# (list) -> list
chop = $(wordlist 2,$(words $1),x $1)

# (list, function, state) -> state
reduce = $(if $(word 2,$1),$(call reduce,$(call chop,$1),$2,$(call $2,$3,$(lastword $1))),$(call $2,$3,$(lastword $1)))

# (list, function, state) -> state
reduce_right = $(if $(word 2,$1),$(call reduce_right,$(call tail,$1),$2,$(call $2,$3,$(firstword $1))),$(call $2,$3,$(firstword $1)))

# (list, function)
map = $(foreach item,$1,$(call $2))
