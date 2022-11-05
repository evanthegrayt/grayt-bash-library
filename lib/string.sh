##
# Changes the string to upper case.
STRING_upcase() {
    tr '[:lower:]' '[:upper:]' <<< $*
}

##
# Changes the string to lower case.
STRING_downcase() {
    tr '[:upper:]' '[:lower:]' <<< $*
}

##
# Changes the case of the string to upper or lower.
STRING_change_case() {
    local direction="$( STRING_downcase "$1" )"
    local string="$2"

    case $direction in
        up|u|upper|big)
            STRING_upcase "$string"
            ;;
        down|d|l|lower|small)
            STRING_downcase "$string"
            ;;
    esac
}

##
# Removes leading and trailing space from string.
STRING_strip() {
    echo "$*" | xargs
}

##
# Removes ALL spaces from string.
STRING_trim_all_spaces() {
    tr -d '[:space:]' <<< $*
}

##
# Returns string with all consective spaces replaced by a single space.
STRING_uniform_spacing() {
    echo $* | xargs
}

##
# True if string begins with substr.
STRING_start_with() {
    local substr="$1"
    local string="$2"

    [[ "$string" == "$substr"* ]] && return 0 || return 1
}

##
# True if string ends with substr.
STRING_end_with() {
    local substr="$1"
    local string="$2"

    [[ "$string" == *"$substr" ]] && return 0 || return 1
}

##
# True if string contains substr.
STRING_include() {
    local substr="$1"
    local string="$2"

    [[ "$string" == *"$substr"* ]] && return 0 || return 1
}

##
# Returns length of string.
STRING_length() {
    local string="$1"

    echo "${#string}"
}

##
# If string contains no characters, including spaces.
STRING_empty() {
    local string="$1"

    (( ${#string} == 0 )) && return 0 || return 1
}

##
# If string is nothing but whitespace or empty.
STRING_blank() {
    local string="$( STRING_strip "$1" )"

    (( ${#string} == 0 )) && return 0 || return 1
}
