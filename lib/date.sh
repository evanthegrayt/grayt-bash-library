# "public" functions

##
# Name of month of date.
DATE_month_name() {
    local EDATE="$1"

    date --date="$EDATE" +%B
}

##
# Today's date.
DATE_todays_date() {
    local OPTION=$1
    local FORMAT=$( _set_date_format ${OPTION:-dash} )

    date "$FORMAT"
}

##
# Parses a string as a date and returns in specified format.
DATE_parse_date() {
    local DATE=$1
    local OPTION=$2
    local FORMAT=$( _set_date_format ${OPTION:-dash} )

    date -d "$DATE" "$FORMAT"
}

# "private" functions

##
# Sets the date format.
_set_date_format() {
    local OPTION="${1:-none}"

    case "$OPTION" in
        dash|dashes)
            local FORMAT="+%Y-%m-%d"
            ;;
        slash|slashes)
            local FORMAT="+%d/%m/%Y"
            ;;
        american|slashes-american|slash-american)
            local FORMAT="+%m/%d/%Y"
            ;;
        none|*)
            local FORMAT="+%Y%m%d"
            ;;
    esac

    echo "$FORMAT"
}

