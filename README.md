# bash-lib
Library of common bash functions I commonly use.

## Installation
Clone the repository.
```sh
git clone https://github.com/evanthegrayt/bash-lib.git
```
Run the install script
```sh
cd bash-lib
bin/install
```
If you want to install them somewhere other than `/usr/local/bin`, pass a
directory as an argument.
```sh
bin/install ~/bin
```

## Using the library
Bash will source files in your path that are non-executable and end with `.sh`.
By default, the [install script](bin/install) links the files to
`/usr/local/bin`, which is usually in your file path. Once the files are in your
path, you only need to source them by their name.
```sh
source arrays.sh
# stuff with arrays...
```
Functions available in the files are all prefixed with the file name, all
uppercase.
```sh
# dates.sh

DATES_get_month_name() {
    local EDATE="$1"

    date --date="$EDATE" +%B
}

DATES_todays_date() {
    local OPTION=$1
    local FORMAT=$( _set_date_format $OPTION )

    date "$FORMAT"
}

# Etc...
```

