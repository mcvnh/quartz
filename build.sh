#!/bin/sh
set -e

mkdir -p ~/.ssh
echo "$NOTES_SSH_KEY" > ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519
ssh-keyscan github.com >> ~/.ssh/known_hosts

# Debug: check key is loaded
ls -la ~/.ssh

git clone git@github.com:mcvnh/zetta.git notes

# Replace Quartz content/ folder
rm -rf content
cp -R notes/content ./content

# Now build Quartz
npm install
npx quartz build
