#!/bin/bash
set -e
unset DISPLAY
export GPG_TTY=$(tty)
export PASSPHRASE=$GPG_PASSPHRASE
gpg --import --batch private.key
make
