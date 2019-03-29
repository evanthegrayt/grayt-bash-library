# "public" functions

DATE_get_month_name() {
    local EDATE="$1"

    date --date="$EDATE" +%B
}

DATE_todays_date() {
    local OPTION=$1
    local FORMAT=$( _set_date_format $OPTION )

    date "$FORMAT"
}

DATE_first_of_month() {
    local OPTION=$2
    local DATE=$( DATE_parse_date "$1" $OPTION )
    local FORMAT=$( _set_date_format $OPTION )

    DATE="$( DATE_parse_date $DATE | cut -c1-6 )01"

    date -d "$DATE" "$FORMAT"
}

DATE_first_of_year() {
    local OPTION=$2
    local DATE=$( DATE_parse_date "$1" $OPTION )
    local FORMAT=$( _set_date_format $OPTION )

    DATE="$( DATE_parse_date $DATE | cut -c 1-4 )0101"

    date -d "$DATE" "$FORMAT"
}

DATE_parse_date() {
    local DATE=$1
    local OPTION=$2
    local FORMAT=$( _set_date_format $OPTION )

    date -d "$DATE" "$FORMAT"
}

# "private" functions

_set_date_format() {
    local OPTION="${1:-none}"

    case "$OPTION" in
        dash|dashes)
            local FORMAT="+%Y-%m-%d"
            ;;
        none|*)
            local FORMAT="+%Y%m%d"
            ;;
    esac

    echo "$FORMAT"
}

