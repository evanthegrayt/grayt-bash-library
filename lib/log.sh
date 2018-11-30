# vi: set tabstop=4:

# PUBLIC API

LOG_info() {
    local msg="$1"

    _log 'INFO' "$msg"

    return 0
}

LOG_warn() {
    local msg="$1"

    _log 'WARNING' "$msg"

    return 0
}

LOG_fatal() {
    local msg="$1"

    _log 'FATAL' "$msg"

    return 1
}

# PRIVATE API

_log() {
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

