# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    source_list.mk                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/15 04:06:12 by bgenia            #+#    #+#              #
#    Updated: 2021/09/28 04:58:28 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifndef _MKT_SOURCE_LIST_MK_
_MKT_SOURCE_LIST_MK_ := 1

ifneq ($(SHELL), /bin/sh)
	_MKT_ECHO_FLAGS := -e
endif

_MKT_\t := $(shell echo $(_MKT_ECHO_FLAGS) "\t")
_MKT_\n := $(shell echo $(_MKT_ECHO_FLAGS) "\n")

# (directory)
_MKT_find_sources = $(shell find $1 -type f -name '*.c')

# (file, var, sources)
define _MKT_write_sources =

ifndef _MTK_SOURCE_FILE_EXISTS_$1

$$(file >$1)
_MTK_SOURCE_FILE_EXISTS_$1 = 1

else

$$(file >>$1,$(_MKT_\n))

endif

$$(file >>$1,$2 := \)
$$(foreach source,$3,$$(file >>$1,$(_MKT_\t)$$(source) \))

endef

# (file, var, directory)
define source_list =

$(eval $(call _MKT_write_sources,$1,$2,$(call _MKT_find_sources,$3)))
$(eval include $1)

endef

# (file, var, sources)
define source_list_of =

$(eval $(call _MKT_write_sources,$1,$2,$3)
$(eval include $1)

endef

endif
