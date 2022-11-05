# "public" functions

##
# Name of month of date.
DATE_month_name() {
    local edate="$1"

    date --date="$edate" +%B
}

##
# Today's date.
DATE_todays_date() {
    local option=$1
    local format=$( _set_date_format ${option:-dash} )

    date "$format"
}

##
# Parses a string as a date and returns in specified format.
DATE_parse_date() {
    local date=$1
    local option=$2
    local format=$( _set_date_format ${option:-dash} )

    date -d "$date" "$format"
}

# "private" functions

##
# Sets the date format.
_set_date_format() {
    local option="${1:-none}"
    local format

    case "$option" in
        dash|dashes)
            format="+%Y-%m-%d"
            ;;
        slash|slashes)
            format="+%d/%m/%Y"
            ;;
        american|slashes-american|slash-american)
            format="+%m/%d/%Y"
            ;;
        none|*)
            format="+%Y%m%d"
            ;;
    esac

    echo "$format"
}
