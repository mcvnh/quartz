mkdir -p ~/.ssh
echo "$NOTES_SSH_KEY" > ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519

# Avoid "host verification" failure
ssh-keyscan github.com >> ~/.ssh/known_hosts

# Clone your private note repo
git clone git@github.com:mcvnh/zetta.git notes

# Replace Quartz content/ folder
rm -rf content
cp -R notes/content ./content

# Now build Quartz
npm install
npx quartz build
