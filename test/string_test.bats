source ../lib/string.sh

@test 'string upcase' {
    result=$( STRING_upcase 'a string' )

    [[ $result == 'A STRING' ]]
}

@test 'string downcase' {
    result=$( STRING_downcase 'A STRING' )

    [[ $result == 'a string' ]]
}

@test 'string change case up' {
    result=$( STRING_change_case up 'a string' )

    [[ $result == 'A STRING' ]]
}

@test 'string change case down' {
    result=$( STRING_change_case down 'A STRING' )

    [[ $result == 'a string' ]]
}

@test 'string strip' {
    result=$( STRING_strip '   a string    ' )

    [[ $result == 'a string' ]]
}

@test 'string trim all spaces' {
    result=$( STRING_trim_all_spaces '   a string    ' )

    [[ $result == 'astring' ]]
}

@test 'string uniform spacing' {
    result=$( STRING_uniform_spacing ' this   is  a string    ' )

    [[ $result == 'this is a string' ]]
}

@test 'string start with' {
    STRING_start_with 'str' 'string'
}

@test 'string end with' {
    STRING_end_with 'ing' 'string'
}

@test 'string include' {
    STRING_include 'trin' 'string'
}

@test 'string length' {
    result=$( STRING_length 'string' )
    (( $result == 6 ))
}

@test 'string empty' {
    STRING_empty ''
}

@test 'string blank' {
    STRING_blank '    '
}

