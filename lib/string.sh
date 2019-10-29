
STRING_upcase() {
    echo $* | tr '[:lower:]' '[:upper:]'
}

STRING_downcase() {
    echo $* | tr '[:upper:]' '[:lower:]'
}

STRING_change_case() {
    local direction="$( STRING_downcase "$1" )"
    local string="$2"

    case $direction in
        up|u|upper|big)
            STRING_upcase "$string"
            ;;
        down|d|l|lower|small)
            STRING_upcase "$string"
            ;;
    esac
}

STRING_strip() {
    echo "$*" | sed -e 's/^ *//g' -e 's/ *$//g'
}

STRING_trim_all_spaces() {
    echo "$*" | tr -d [:space:]
}

STRING_uniform_spacing() {
    echo $* | xargs echo
}

STRING_start_with() {
    local substr="$1"
    local string="$2"

    [[ "$string" == "$substr"* ]] && return 0 || return 1
}

STRING_end_with() {
    local substr="$1"
    local string="$2"

    [[ "$string" == *"$substr" ]] && return 0 || return 1
}

STRING_include() {
    local substr="$1"
    local string="$2"

    [[ "$string" == *"$substr"* ]] && return 0 || return 1
}

STRING_length() {
    local string="$1"

    echo ${#string}
}

alias STRING_size=STRING_length

STRING_empty() {
    local string="$1"

    (( ${#string} == 0 )) && return 0 || return 1
}

STRING_blank() {
    local string="$( STRING_strip $1 )"

    (( ${#string} == 0 )) && return 0 || return 1
}
