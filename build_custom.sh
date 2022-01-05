files="src/ops_bulk.c src/types.c src/util.c src/main.c"

optimizations="-O3"

infoargs="--version"

gcc -o build-custom $optimizations $infoargs -Iinclude -Isrc $files

sep

