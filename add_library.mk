# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    add_library.mk                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/01 03:06:54 by bgenia            #+#    #+#              #
#    Updated: 2021/09/28 04:53:57 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# (library_file) -> library_flag
_MKT_get_library_flag = $(patsubst lib%.a,-l%,$(patsubst lib%.so,-l%,$1))

# (path, headers, linker_flags, make_flags)
define _MKT_add_library

LIBS += $1

LIBLDFLAGS += -L$(dir $1)
LIBLDLIBS += $(call _MKT_get_library_flag,$(notdir $1)) $3
LIBFLAGS += -L$(dir $1) $(call _MKT_get_library_flag,$(notdir $1)) $3
LIBINCLUDES += $2

.PHONY: $1 $1_clean $1_fclean $1_re

$1:
	$(MAKE) $4 -C $(dir $1)

$1_clean:
	$(MAKE) clean -C $(dir $1)

$1_fclean: $1_clean
	$(MAKE) fclean -C $(dir $1)

$1_re: $1_fclean
	$(MAKE) $4 -C $(dir $1)

endef

# (path, headers, linker_flags, make_flags)
define add_library

$(eval $(call _MKT_add_library,$1,$2,$3,$4))

endef
