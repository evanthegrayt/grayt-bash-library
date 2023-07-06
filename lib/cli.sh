CLI_abort() {
    local message="$1"
    local return_code="${2:-1}"

    echo "$message" >&2
    exit $return_code
}

##
# Print a message with color.
# https://stackoverflow.com/a/33206814/2489882
# https://notes.burke.libbey.me/ansi-escape-codes/
#
# Usage: CLI_echoc [OPTIONS] MESSAGE
# Options:  -B          | Bright
#           -f COLOR    | Foreground (black red green yellow blue purple cyan white)
#           -b COLOR    | Background (black red green yellow blue purple cyan white)
#           -m MODIFIER | Modifier(s) (normal bold faint italic underline blink fastblink)
#
# The matcher for `text_modifiers` matches as long as the string contains the
# required substring. So, if you were to pass "italics bolded" instead of
# "italic bold", or even "boldeditalicized", it will still work.
#
# Be aware that not all modifiers will work in all terminals, and some might
# need to be enabled via your terminal's configuration.
#
# @example
#   CLI_echoc -f blue -b white -m bold -m italic "Hello world"
CLI_echoc() {
    local color=""
    local background_color=""
    local text_modifiers=""
    local bright=false

    local i
    local color_string='\033['
    local fg_color_prefix="3"
    local bg_color_prefix="4"
    local basic_modifiers=(normal bold faint italic underline blink fastblink)

    local OPTIND

    while getopts "f:b:m:Bh" opts; do
        case "$opts" in
            B)
                bright=true
                ;;
            m)
                text_modifiers+=$OPTARG
                ;;
            f)
                color=$OPTARG
                ;;
            b)
                background_color=$OPTARG
                ;;
            h)
                echo "USAGE: CLI_echoc [OPTIONS] MESSAGE"
                echo
                echo "Options:"
                echo "-B             | Bright"
                echo "-f COLOR       | Foreground color"
                echo "-b COLOR       | Background color"
                echo "-m MODIFIER(S) | normal bold faint italic underline blink fastblink"
                return
                ;;
        esac
    done

    shift $(( OPTIND - 1 ))

    local message="$1"

    if $bright; then
        fg_color_prefix="9"
        bg_color_prefix="10"
    fi

    if [[ -n $text_modifiers ]]; then
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
