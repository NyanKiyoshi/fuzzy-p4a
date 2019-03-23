cd $(dirname $0)

IFS='
'
for f in $(find .git-hooks -type f); do
    ln -v "$f" ".git/hooks/$(basename "$f")"
done

