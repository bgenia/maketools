#!/bin/bash
MAKEFILE="sources.mk"

declare -A SOURCES

SOURCES=(
	["SRC_LIST"]="src"
)

> $MAKEFILE

space=false

for src in "${!SOURCES[@]}"
do
	if [ $space == true ]
	then
		echo >> $MAKEFILE
	fi

	cat >> $MAKEFILE <<< "$src := \\"

	find "${SOURCES[$src]}" -type f -name '*.c' \
		| awk '{ print "\t" $0 " \\"; }' \
		>> $MAKEFILE

	space=true
done
