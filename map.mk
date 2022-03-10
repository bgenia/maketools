# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    map.mk                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/12 01:39:05 by bgenia            #+#    #+#              #
#    Updated: 2022/03/10 15:16:20 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifndef _MKT_MAP_MK_
_MKT_MAP_MK_ := 1

_MKT_map_special_keys := @

# (name) -> map_path_list
_MKT_map_split_path = $(subst ],,$(subst [,$(eval) ,$1))

# (name, var) -> keys
_MKT_map_keys_var = $(filter-out $(_MKT_map_special_keys),$(word $(words x $(call _MKT_map_split_path,$1)),$(call _MKT_map_split_path,$2)))

# (name) -> keys
map_keys = $(sort $(foreach var,$(filter $1[%],$(.VARIABLES)),$(call _MKT_map_keys_var,$1,$(var))))

# (name) -> values
map_values = $(foreach key,$(call map_keys,$1),$(call map_try_serialize,$1[$(key)]))

# (name) -> string
map_serialize = $(foreach key,$(call map_keys,$1),[$(key)]=($(call _MKT_map_try_serialize,$1[$(key)])))

# (value) -> string
_MKT_map_try_serialize = $(or $(call map_serialize,$1),$($1))

# (name)
define _MKT_decalre_map =
$1 = $$(call map_serialize,$1)
$1[@] = $$(call map_values,$1)
!$1[@] = $$(call map_keys,$1)
endef

# (name)
declare_map = $(eval $(call _MKT_decalre_map,$1))

endif
