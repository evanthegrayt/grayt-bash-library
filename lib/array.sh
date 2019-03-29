ARRAY_include() {
    local string="$1"

    for element in "${@:2}"; do
        if [[ "$element" == "$1" ]]; then
            return 0
        fi
    done
    return 1
}

ARRAY_sort_uniq() {
    echo "$@" | sed 's/ /\n/g' | sort -u | sed 's/\n/ /g'
}

