#!/usr/bin/env bash
set -ue

DOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
PACKAGES=(zsh git vim karabiner claude gh ghostty ccstatusline anyenv configstore raycast)

helpmsg() {
  echo "Usage: $0 [--help | -h] [--delete | -D] [--adopt] [package ...]"
  echo ""
  echo "Options:"
  echo "  --adopt         Adopt existing files into the package (resolve conflicts)"
  echo "  --delete, -D    Remove symlinks (unstow)"
  echo "  --help, -h      Show this help"
  echo ""
  echo "If no packages are specified, all packages will be stowed."
  echo "Available packages: ${PACKAGES[*]}"
}

# Check stow is installed
if ! command -v stow &> /dev/null; then
  echo "Error: GNU Stow is not installed. Install it with: brew install stow"
  exit 1
fi

DELETE=false
ADOPT=false
TARGETS=()

while [ $# -gt 0 ]; do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 0
      ;;
    --adopt)
      ADOPT=true
      ;;
    --delete|-D)
      DELETE=true
      ;;
    *)
      TARGETS+=("$1")
      ;;
  esac
  shift
done

# Default to all packages if none specified
if [ ${#TARGETS[@]} -eq 0 ]; then
  TARGETS=("${PACKAGES[@]}")
fi

cd "$DOTDIR"

for pkg in "${TARGETS[@]}"; do
  if [ ! -d "$pkg" ]; then
    echo "Warning: package '$pkg' not found, skipping"
    continue
  fi

  if [ "$DELETE" = true ]; then
    echo "Unstowing $pkg..."
    stow -D -t "$HOME" "$pkg"
  else
    echo "Stowing $pkg..."
    if [ "$ADOPT" = true ]; then
      stow --adopt -t "$HOME" "$pkg"
    else
      stow -t "$HOME" "$pkg"
    fi
  fi
done

echo -e "\e[1;36m Done! \e[m"
