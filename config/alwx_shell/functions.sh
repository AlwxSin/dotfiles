function grnr() {
    git fetch origin --prune && git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D
}

function claude() {
  local hub="/home/alwx/Projects/f/.claude/skills"
  if [[ "$PWD" == /home/alwx/Projects/f/* && -d "$hub" ]]; then
    mkdir -p .claude/skills
    for skill in "$hub"/*/; do
      local name=$(basename "$skill")
      local target=".claude/skills/$name"
      if [[ ! -e "$target" || -L "$target" ]]; then
        ln -sfn "$skill" "$target"
      fi
    done
  fi
  command claude "$@"
}
