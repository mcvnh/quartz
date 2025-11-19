SOURCE=""
DEST=""

ORIGIN_DIR=$(pwd)

cd "$DEST" || { echo "Failed to cd into $DEST"; exit 1; }
git pull origin main
rsync -ahrtuv --exclude "*.pdf" --delete "$SOURCE" ./content
git add . && git commit -am "update content"
git push origin main
