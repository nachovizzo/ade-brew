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

# Fix some madeness about Python3.10 being the default in Ubuntu:22.04 and 3.11 in Homebrew
# FIXME: This is probably the only weak point of this setup. And there is a hardcoded python vesion,
# in this env, which sucks :)
export PATH="$HOMEBREW_PREFIX/opt/python@3.10/libexec/bin:$PATH"
export PYTHONPATH=$PYTHONPATH:/usr/lib/python3/dist-packages/
export PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig"
