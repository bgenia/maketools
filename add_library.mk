# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    add_library.mk                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/01 03:06:54 by bgenia            #+#    #+#              #
#    Updated: 2022/03/12 06:53:38 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifndef _MKT_ADD_LIBRARY_MK_
_MKT_ADD_LIBRARY_MK_ := 1

# (library_file) -> library_flag
_MKT_get_library_flag = $(patsubst lib%.a,-l%,$(patsubst lib%.so,-l%,$1))

# (path, headers, make_flags)
define _MKT_add_library
LIBS += $1

LIBLDFLAGS += -L$(dir $1)
LIBLDLIBS += $(call _MKT_get_library_flag,$(notdir $1))
LIBFLAGS += -L$(dir $1) $(call _MKT_get_library_flag,$(notdir $1))
LIBINCLUDES += $2

.PHONY: $1@build $1@clean $1@fclean $1@re

# This is a stupid no-op target hack to properly build libraries
$1: $1@build ;

$1@build:
	$(MAKE) $3 -C $(dir $1)

$1@clean:
	$(MAKE) clean -C $(dir $1)

$1@fclean:
	$(MAKE) fclean -C $(dir $1) || $(MAKE) clean -C $(dir $1)

$1@re: $1@fclean
	$(MAKE) $3 -C $(dir $1)
endef

# (path, headers, make_flags)
add_library = $(eval $(call _MKT_add_library,$1,$2,$3))

endif
