PROJECT_ROOT=$(pwd)
SOURCES_SCRIPT="maketools/sources.sh"

watchman-make --root $PROJECT_ROOT --pattern '**/*.c' --run $SOURCES_SCRIPT
