# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    source_list.mk                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/09 22:13:48 by bgenia            #+#    #+#              #
#    Updated: 2021/09/11 15:46:14 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

define _SOURCE_SCRIPT_START

declare -A source_map

create_source_list() {
	> $1

	space=false

	for src in ${!source_map[@]}
	do
		if [ $space == true ]
		then
			echo >> $1
		fi

		cat >> $1 <<< "$src := \\"

		find "${source_map[$src]}" -type f -name '*.c' \
			| awk '{ print "\t" $0 " \\"; }' \
			>> $1

		space=true
	done
}

endef

# (makefile) -> script_entry
define _create_source_script_entry

source_map=($(foreach list,$(_MKT_SRC_MAKEFILES[$1]),["$(list)"]="$(_MKT_SRC_LISTS[$(list)])"))

create_source_list "$1"

endef

# () -> script
define _create_source_script

$(value _SOURCE_SCRIPT_START)

$(foreach makefile,$(_MKT_SRC_MAKEFILES),$(call _create_source_script_entry,$(makefile)))

endef

# (makefile, id, directory)
define _define_source_list

_MKT_SRC_MAKEFILES += $1
_MKT_SRC_MAKEFILES[$1] += $2

_MKT_SRC_LISTS += $2
_MKT_SRC_LISTS[$2] = $3

endef

# (makefile, id, directory)
define_source_list = $(eval $(call _define_source_list,$1,$2,$3))

# ()
generate_source_lists = $(shell $(call _create_source_script))

# Ultimate all-in-one function
# (makefile, id, directory)
define source_list

$(call define_source_list,$1,$2,$3)
$(call generate_source_lists)
$(eval include $1)

endef
