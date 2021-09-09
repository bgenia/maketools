# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    map.mk                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/09 21:55:54 by bgenia            #+#    #+#              #
#    Updated: 2021/09/10 02:49:42 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# (map, key, value)
define _map_set

$1 := $(sort $($1) $2)
$1[$2] := $3

endef

# (map, key, value)
define _map_add

$1 := $(sort $($1) $2)
$1[$2] += $3

endef

# (map, key, value)
map_set = $(eval $(call _map_set,$1,$2,$3))

# (map, key, value)
map_add = $(eval $(call _map_add,$1,$2,$3))

# (map) -> values
map_values = $(foreach key,$($1),$($1[$(key)]))

# (map) -> string
map_stringify = $(foreach key,$($1),[$(key)]=($($1[$(key)])))
