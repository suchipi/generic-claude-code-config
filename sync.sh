#!/usr/bin/env bash

set -euo pipefail

# This script assumes the target directory is the cwd it was called from.
TARGET_DIR=$(pwd)
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

if [[ "${1:-}" == "" ]]; then
  echo "Specify the branch to sync with as the first argument to this script ('work' or 'personal')."
fi

cd "$SCRIPT_DIR"
git checkout "$1"
git pull

cd "$TARGET_DIR"
mkdir -p .claude/rules
cp -R $SCRIPT_DIR/.claude/rules/* .claude/rules
