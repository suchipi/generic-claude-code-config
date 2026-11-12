#!/usr/bin/env bash

set -euo pipefail

# This script assumes the target directory is the cwd it was called from.
TARGET_DIR=$(pwd)
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

cd "$SCRIPT_DIR"
git checkout work
git pull

cd "$TARGET_DIR"
mkdir -p .claude/rules
cp -R $SCRIPT_DIR/.claude/rules/* .claude/rules
cp $SCRIPT_DIR/.claude/settings.json .claude/settings.json
