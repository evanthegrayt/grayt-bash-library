CLI_abort() {
    local message="$1"
    local return_code="${2:-1}"

    echo "$message" >&2
    exit $return_code
}
