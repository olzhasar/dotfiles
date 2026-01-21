#!/usr/bin/env bash
set -euo pipefail

# Run the Linux playbook against the local machine.
if [[ -r /etc/os-release ]]; then
  . /etc/os-release
else
  echo "Unable to detect Linux distribution (/etc/os-release missing)." >&2
  exit 1
fi

playbook=""
case "${ID:-}" in
  ubuntu|debian)
    playbook="linux/playbook-ubuntu.yaml"
    ;;
  fedora)
    playbook="linux/playbook-fedora.yaml"
    ;;
  *)
    if [[ "${ID_LIKE:-}" == *"debian"* ]]; then
      playbook="linux/playbook-ubuntu.yaml"
    elif [[ "${ID_LIKE:-}" == *"fedora"* ]] || [[ "${ID_LIKE:-}" == *"rhel"* ]]; then
      playbook="linux/playbook-fedora.yaml"
    else
      echo "Unsupported Linux distribution: ${ID:-unknown}" >&2
      exit 1
    fi
    ;;
esac

ansible-playbook -i "devmachines," -c local --ask-become-pass "$playbook"
