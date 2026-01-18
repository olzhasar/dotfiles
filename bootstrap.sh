#!/usr/bin/env bash
set -euo pipefail

case "$(uname)" in
  Darwin)
    ./darwin/bootstrap.sh
    ;;
  Linux)
    ./linux/bootstrap.sh
    ;;
  *)
    echo "Unsupported OS: $(uname)" >&2
    exit 1
    ;;
esac
