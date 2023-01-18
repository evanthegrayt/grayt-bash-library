# PUBLIC API

##
# Log general information.
LOG_info() {
    local msg="$1"

    _LOG_write 'INFO' "$msg"

    return 0
}

##
# Log warnings.
LOG_warn() {
    local msg="$1"

    _LOG_write 'WARNING' "$msg"

    return 0
}

##
# Log errors.
LOG_error() {
    local msg="$1"

    _LOG_write 'ERROR' "$msg"

    return 1
}

##
# Log errors that cause the script to die.
LOG_fatal() {
    local msg="$1"

    _LOG_write 'FATAL' "$msg"

    return 1
}

# PRIVATE API

_LOG_write() {
    if [[ -z $LOG_directory ]]; then
        echo "You must set LOG_directory='DIR' in your script!"
        return 1
    fi

    local mode="$1"
    local msg="$2"
    local program="${BASH_SOURCE[${#BASH_SOURCE[@]}-1]##*/}"
    local file="$LOG_directory/${program}_$( date +%Y%m%d ).log"
    local date=$( date "+%Y-%m-%d %X" )

    [[ -d "$LOG_directory" ]] || mkdir -p "$LOG_directory"
    [[ -f "$file" ]] || > "$file"

    echo "${mode:0:1}, [$date] $mode -- : $msg" >> "$file"
}
