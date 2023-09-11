#!/usr/bin/env bash
export HOMEBREW_ADE_PREFIX="$HOME/.linuxbrew"
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_NO_AUTO_UPDATE=1

if [[ ! -d "${HOMEBREW_ADE_PREFIX}" ]]; then
    cp -r /opt/homebrew ${HOMEBREW_ADE_PREFIX}
fi

if [[ ! -d "${HOMEBREW_PREFIX}" ]]; then
    sudo mkdir -p /home/linuxbrew
    sudo ln -s ${HOMEBREW_ADE_PREFIX} ${HOMEBREW_PREFIX} || true
    sudo chown -R $(whoami) /home/linuxbrew
fi

# Source Homebrew, the rest is story
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
