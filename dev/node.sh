#!/bin/bash
set -e

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/refs/heads/master/nvm.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install --lts
nvm use --lts

# Verify the Node.js version:
node -v # Should print "v24.9.0".

# Verify npm version:
npm -v # Should print "11.6.0".
