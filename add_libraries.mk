# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    add_libraries.mk                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/10 13:24:37 by bgenia            #+#    #+#              #
#    Updated: 2022/03/10 15:12:23 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifndef _MKT_ADD_LIBRARIES_MK_
_MKT_ADD_LIBRARIES_MK_ := 1

ifndef _MKT_ADD_LIBRARY_MK_
    $(error maketools/add_libraries requires maketools/add_library to work)
endif

# (library_item)
_MKT_add_library_from_list = $(call add_libary,$(word 1 $(subst :, ,$1)),$(word 2 $(subst :, ,$1)),$(word 3 $(subst :, ,$1)))

$(foreach lib,$(.LIBRARIES),$(call _MKT_add_library_from_list,$(lib)))

endif
