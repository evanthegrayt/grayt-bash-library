# bash-lib
Library of common bash functions I commonly use.

## Installation
Clone the repository.
```sh
git clone https://github.com/evanthegrayt/bash-lib.git
```
If you want the files to be linked in an existing directory in your `$PATH`, Run
the install script.
```sh
cd bash-lib
bin/install
```
If you want to install them somewhere other than `/usr/local/bin`, pass a
directory as an argument.
```sh
bin/install ~/bin
```
If you want to just add the repository to your path, add the following line to
your `~/.bashrc`, assuming `$path_to_repo` is the full path to the `bash-lib`
repository:
```sh
export PATH=$PATH:$path_to_repo/lib
```
Lastly, you could just `source` the files without adding them to your path by
passing the full path to the files. Assuming `$path_to_repo` is the full path to
the `bash-lib` repository:
```sh
source $path_to_repo/lib/arrays.sh # ...or whichever file you want to source.
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
uppercase. For instance, functions in `dates.sh` are formatted like so:
```sh
# dates.sh

DATES_get_month_name() {
  # stuff
}

DATES_todays_date() {
  # more stuf
}
# Etc...
```

## Using the functions
If the function returns an integer, it is most likely being used as a boolean,
and can be called as such:
```sh
source arrays.sh

arr=(one two three)

if ARRAYS_includes_element 'two' "${arr[@]}"; then
    echo "'two' is in the array."
fi
# => 'two' is in the array.
```
Functions in `bash` can't return a string, so if the function "returns" a
string (either by using a command's output or printing a string via `echo`) you
have to capture it using command substitution:

```sh
source dates.sh
today=$( DATES_todays_date )

echo $today
# => 20190328
# (Date formats can be changed with optional arguments)
```

