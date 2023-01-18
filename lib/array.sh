##
# True if element is in array.
ARRAY_include() {
    local element
    local needle="$1"

    for element in "${@:2}"; do
        if [[ $element == $needle ]]; then
            return 0
        fi
    done
    return 1
}

##
# Returns array with duplicates removed.
# NOTE: Will not work if array elements contain spaces.
ARRAY_sort_uniq() {
    printf "%s\n" "$@" | sort -u
}
