CLI_abort() {
    local message="$1"
    local return_code="${2:-1}"

    echo "$message" >&2
    exit $return_code
}

##
# Print a message with color.
#
# Usage: CLI_echoc MESSAGE [TEXT_COLOR] [BACKGROUND_COLOR] [TEXT_MODIFIERS]
#
# Valid colors are:
#   black red green yellow blue purple cyan white
#
# Valid text modifiers are:
#   normal bold italic underline blink fastblink bright
#
# The matcher for `text_modifiers` matches as long as the string contains the
# required substring. So, if you were to pass "italics bolded" instead of
# "italic bold", or even "boldeditalicized", it will still work.
#
# Be aware that not all modifiers will work in all terminals, and some might
# need to be enabled via your terminal's configuration.
#
# @example
#   CLI_echoc "Hello world" blue white "bold italic"
#
#   # With some parameters omitted:
#   CLI_echoc "Hello world" "" "" "bold italic"
CLI_echoc() {
    local message="$1"
    local color="$2"
    local background_color="$3"
    local text_modifiers="$4"

    local i
    local color_string='\e['
    local fg_color_prefix="3"
    local bg_color_prefix="4"
    local basic_modifiers=(normal bold faint italic underline blink fastblink)

    if [[ -n $text_modifiers ]]; then
        if [[ $text_modifiers == *bright* ]]; then
            fg_color_prefix="9"
            bg_color_prefix="10"
        fi

        for (( i = 0; i < ${#basic_modifiers[@]}; i++ )); do
            [[ $text_modifiers == *${basic_modifiers[$i]}* ]] && color_string+="$i;"
        done
    fi

    if [[ -n $background_color ]]; then
        color_string+="$bg_color_prefix$( _CLI_color_suffix $background_color );"
    fi

    if [[ -n $color ]]; then
        color_string+="$fg_color_prefix$( _CLI_color_suffix $color );"
    fi

    printf "${color_string%;}m%s\e[0m\n" "$message"
}

_CLI_color_suffix() {
    local color="$1"

    case $color in
        black) echo "0" ;;
        red) echo "1" ;;
        green) echo "2" ;;
        yellow) echo "3" ;;
        blue) echo "4" ;;
        purple) echo "5" ;;
        cyan) echo "6" ;;
        white) echo "7" ;;
    esac
}
