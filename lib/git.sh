GIT_branch() {
    git rev-parse --abbrev-ref HEAD
}

GIT_squash() {
    local num_of_commits=$1

    if [[ -z $num_of_commits ]]; then
        echo "Must pass number of commits to squash!" >&2
        return 1
    elif [[ ! $num_of_commits =~ '^[0-9]+$' ]]; then
        echo "Argument must be a number!" >&2
        return 1
    fi

    git rebase -i HEAD~$num_of_commits
}
