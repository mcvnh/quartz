SOURCE="/Users/anhmv/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/ZETTA/*"
DEST="/Users/anhmv/PARA/Projects/notes"
CONTENT="$DEST/content"

cd "$DEST_ROOT"
git pull origin main
rsync -avh --exclude "*.pdf" --delete "$SOURCE" "$CONTENT"
git add . && git commit -am "update content"
git push origin main
