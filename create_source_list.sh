#!/bin/bash
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
