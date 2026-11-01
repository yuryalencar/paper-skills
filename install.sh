#!/usr/bin/env sh
# Install skills from this repo into ~/.claude/skills (or a target of your choosing).
#
#   ./install.sh <skill-name> [<skill-name> ...]
#   ./install.sh --all                      every skill
#   ./install.sh --list                     show available skills
#   ./install.sh --link <skill-name>        symlink instead of copy
#   ./install.sh --project <skill-name>     install into ./.claude/skills instead
#   ./install.sh --force <skill-name>       overwrite without asking
#
# skills/ is flat, matching the layout Claude Code installs.
#
set -eu

REPO_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SRC_DIR="$REPO_DIR/skills"
DEST_DIR="$HOME/.claude/skills"
LINK=0
FORCE=0

usage() {
  sed -n '2,12p' "$0" | sed 's/^# \{0,1\}//'
  exit "${1:-0}"
}

skill_names() {
  [ -d "$SRC_DIR" ] || return 0
  for d in "$SRC_DIR"/*/; do
    [ -f "$d/SKILL.md" ] || continue
    basename "$d"
  done
}

list_skills() {
  found=0
  for name in $(skill_names); do
    found=1
    printf '  %s\n' "$name"
  done
  [ "$found" -eq 1 ] || printf '  (no skills in this repo yet)\n'
}

install_one() {
  name=$1
  src="$SRC_DIR/$name"

  if [ ! -f "$src/SKILL.md" ]; then
    printf 'error: no skill named "%s"\n\navailable:\n' "$name" >&2
    list_skills >&2
    return 1
  fi

  mkdir -p "$DEST_DIR"
  dest="$DEST_DIR/$name"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if [ "$FORCE" -eq 1 ]; then
      rm -rf "$dest"
    else
      printf 'replace existing %s? [y/N] ' "$dest"
      if [ -r /dev/tty ]; then
        read -r reply </dev/tty || reply=n
      else
        read -r reply || reply=n
      fi
      case "$reply" in
        [yY]*) rm -rf "$dest" ;;
        *) printf 'skipped %s\n' "$name"; return 0 ;;
      esac
    fi
  fi

  if [ "$LINK" -eq 1 ]; then
    ln -s "$src" "$dest"
    printf 'linked  %s -> %s\n' "$name" "$dest"
  else
    cp -R "$src" "$dest"
    printf 'copied  %s -> %s\n' "$name" "$dest"
  fi
  installed=$((installed + 1))
}

[ $# -gt 0 ] || usage 1

targets=""
all=0

for arg in "$@"; do
  case "$arg" in
    -h|--help) usage 0 ;;
    -l|--list) printf 'skills in this repo:\n'; list_skills; exit 0 ;;
    --all) all=1 ;;
    --link) LINK=1 ;;
    -f|--force) FORCE=1 ;;
    --project) DEST_DIR="$(pwd)/.claude/skills" ;;
    -*) printf 'error: unknown option %s\n' "$arg" >&2; usage 1 ;;
    *) targets="$targets $arg" ;;
  esac
done

if [ "$all" -eq 1 ]; then
  targets=$(skill_names)
fi

if [ -z "$(printf '%s' "$targets" | tr -d ' \n')" ]; then
  printf 'nothing to install.\n\navailable:\n' >&2
  list_skills >&2
  exit 1
fi

status=0
installed=0
for name in $targets; do
  install_one "$name" || status=1
done

if [ "$installed" -gt 0 ]; then
  printf '\nrestart Claude Code (or run /reload-plugins) to pick up new skills.\n'
fi
exit "$status"
