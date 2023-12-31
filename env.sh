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
    # Yet another strange symlink. Some bottles can't solve the prefix and look for /linuxbrew
    sudo ln -s /home/linuxbrew /linuxbrew || true
    sudo chown -R $(whoami) /linuxbrew
fi

# Source Homebrew, the rest is story
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Fix some madeness about Python3.10 being the default in Ubuntu:22.04 and 3.11 in Homebrew
export PATH="$HOMEBREW_PREFIX/opt/python@3.10/libexec/bin:$PATH"
export PYTHONPATH=$PYTHONPATH:/usr/lib/python3/dist-packages/

# Another env situation: pkg-config from brew won't find the system wide .pc files
export PKG_CONFIG_PATH="$(/usr/bin/pkg-config --variable pc_path pkg-config)"
