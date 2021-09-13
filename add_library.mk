# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    add_library.mk                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/01 03:06:54 by bgenia            #+#    #+#              #
#    Updated: 2021/09/12 16:35:22 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# (library_file) -> library_flag
__get_library_flag = $(patsubst lib%.a,-l%,$(patsubst lib%.so,-l%,$1))

# (path, headers, linker_flags, make_flags)
define _add_library

LIBS += $1
LIBFLAGS += -L$(dir $1) $(call __get_library_flag,$(notdir $1)) $3
LIBINCLUDES += $2

.PHONY: $1
$1:
	$(MAKE) $4 -C $(dir $1)

endef

# (path, headers, linker_flags, make_flags)
define add_library

$(eval $(call _add_library,$1,$2,$3,$4))

endef
