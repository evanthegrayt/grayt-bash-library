# bash-lib
A library of `bash` functions to help deal with dates, arrays, strings, etc.

Please feel free to contribute!

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
## Compatibility
While I'd like to think I'm decent at shell scripting, I'll be the first to
admit that my knowledge of true `bash`-isms is lacking. If you see something
done with an external command that could be done with pure `bash`, please
[submit an issue](https://github.com/evanthegrayt/bash-lib/issues/new). The same
goes for POSIX compatibility; let me know if you see something non-POSIX that
could be done in a way that maintains compliance, or better yet, uses pure `bash`.

The caveat to this is `bash 3.2` compatibility. I know in `bash 4.0+`, you can
upcase a word with `${var^^}`, but I use these functions at work quite often,
and we're running `bash 3.2` (yeah... I know... we're on 5+ now). If this
repository generates enough interest, I may change this "rule", or at least make
different version of the `lib` for the newer versions of `bash`.

