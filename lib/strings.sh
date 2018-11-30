
STRINGS_upcase() {
    echo $* | tr '[:lower:]' '[:upper:]'
}

STRINGS_downcase() {
    echo $* | tr '[:upper:]' '[:lower:]'
}

STRINGS_change_case() {
    local direction="$( STRINGS_downcase "$1" )"
    local string="$2"

    case $direction in
        up|u|upper|big)
            STRINGS_upcase "$string"
            ;;
        down|d|l|lower|small)
            STRINGS_upcase "$string"
            ;;
    esac
}

STRINGS_trim_surrounding_spaces() {
    echo "$*" | sed -e 's/^ *//g' -e 's/ *$//g'
}

STRINGS_trim_all_spaces() {
    echo "$*" | tr -d [:space:]
}

STRINGS_uniform_spacing() {
    echo $* | xargs echo
}

STRINGS_start_with() {
    local substr="$1"
    local string="$2"

    [[ "$string" == "$substr"* ]] && return 0 || return 1
}

STRINGS_end_with() {
    local substr="$1"
    local string="$2"

    [[ "$string" == *"$substr" ]] && return 0 || return 1
}

STRINGS_include() {
    local substr="$1"
    local string="$2"

    [[ "$string" == *"$substr"* ]] && return 0 || return 1
}

STRINGS_length() {
    local string="$1"

    echo ${#string}
}

alias STRINGS_size=STRINGS_length

STRINGS_empty() {
    local string="$1"

    (( ${#string} == 0 )) && return 0 || return 1
}

