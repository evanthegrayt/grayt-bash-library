#!/usr/bin/env bats

source ../lib/array.sh

@test "Array Includes" {
    array=(dog cat owl)

    ARRAY_include dog ${array[@]}
}

@test "Array Sort Uniq" {
    array=(a a b c c d)
    result_array=( $( ARRAY_sort_uniq "${array[@]}" ) )

    [[ "${result_array[*]}" == 'a b c d' ]]
}
