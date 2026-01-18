#!/usr/bin/env bash
set -euo pipefail

# Run the Linux playbook against the local machine.
ansible-playbook -i "devmachines," -c local --ask-become-pass linux/playbook.yaml
