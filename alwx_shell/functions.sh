function grnr() {
    git fetch origin --prune && git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D
}
