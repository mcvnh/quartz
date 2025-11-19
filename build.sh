#!/bin/sh
set -e

mkdir -p ~/.ssh
echo "$NOTES_SSH_KEY" > ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519

# Create SSH config file
cat > ~/.ssh/config <<EOL
Host github.com
    Hostname github.com
    IdentityFile=~/.ssh/id_ed25519
    StrictHostKeyChecking no
EOL
chmod 600 ~/.ssh/config
cat ~/.ssh/config

git clone git@github.com:mcvnh/zetta.git notes

# Replace Quartz content/ folder
rm -rf content
cp -R notes/content ./content

# Now build Quartz
npm install
npx quartz build
