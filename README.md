# grayt-bash-library
A library of `bash` functions to help deal with [dates](lib/date.sh),
[arrays](lib/array.sh), [strings](lib/string.sh), [logging](lib/log.sh), etc.

Please feel free to contribute!

## Installation
Clone the repository.
```sh
git clone https://github.com/evanthegrayt/grayt-bash-library.git
```
If you want the files to be linked in an existing directory in your `$PATH`, Run
the install script.
```sh
cd grayt-bash-library
bin/install
```
If you want to install them somewhere other than `/usr/local/bin`, pass a
directory as an argument.
```sh
bin/install ~/bin
```
If you want to just add the repository to your path, add the following line to
your `~/.bashrc`, assuming `$path_to_repo` is the full path to the
`grayt-bash-library` repository:
```sh
export PATH=$PATH:$path_to_repo/lib
```
Lastly, you could just `source` the files without adding them to your path by
passing the full path to the files. Assuming `$path_to_repo` is the full path to
the `grayt-bash-library` repository:
```sh
source $path_to_repo/lib/array.sh # ...or whichever file you want to source.
```

## Using the library
Bash will source files in your path that are non-executable and end with `.sh`.
By default, the [install script](bin/install) links the files to
`/usr/local/bin`, which is usually in your file path. Once the files are in your
path, you only need to source them by their name.
```sh
source array.sh
# Do stuff with arrays...
```
Functions available in the files are all prefixed with the file name, all
uppercase. For instance, functions in `date.sh` are formatted like so:
```sh
# date.sh

DATE_get_month_name() {
  # stuff
}

DATE_todays_date() {
  # more stuf
}
# Etc...
```

## Using the functions
If the function returns an integer, it is most likely being used as a boolean,
and can be called as such:
```sh
source array.sh

arr=(one two three)

if ARRAY_include 'two' "${arr[@]}"; then
    echo "'two' is in the array."
fi

# => 'two' is in the array.
```
Functions in `bash` can't return a string, so if the function "returns" a
string (either by using a command's output or printing a string via `echo`) you
have to capture it using command substitution if you need to store it in a
variable:
```sh
source date.sh

today=$( DATE_todays_date )

echo $today

# => 20190328
# (Date formats can be changed with optional arguments)
```
Otherwise, if you just want to output the result to the screen, just call the
function directly:
```sh
source date.sh

DATE_todays_date

# => 20190328
```

## Testing
I used [bats](https://github.com/sstephenson/bats) for testing. To run the tests
yourself, follow the
[README](https://github.com/sstephenson/bats/blob/master/README.md)'s
instructions.

## Compatibility
I want to try and maintain POSIX compatibility where possible. Most of the
scripts I write are in `bash` for portability, but I use `zsh` for my
interactive shell, and I don't want to maintain two different libraries.

That said, if you see something that could be done in a better way, please
[submit an issue](https://github.com/evanthegrayt/grayt-bash-library/issues/new)

## Self-Promotion
I do these projects for fun, and I enjoy knowing that they're helpful to people.
Consider starring [the
repository](https://github.com/evanthegrayt/grayt-bash-library) if you like it!
If you love it, follow me [on github](https://github.com/evanthegrayt)!
