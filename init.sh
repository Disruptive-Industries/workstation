#!/bin/bash

# Install Homebrew and Ansible
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source /etc/os-release
  if [[ "$ID" == "ubuntu" ]]; then
    sudo apt update
    sudo apt install -y software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
  elif [[ "$ID" == "fedora" ]]; then
    sudo dnf install -y ansible
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install ansible
fi

# Run Ansible playbook
ansible-pull -U https://github.com/Disruptive-Industries/workstation
