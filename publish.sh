#!/bin/sh
# Publishes app-ads.txt at https://abomaerd.github.io/app-ads.txt
set -e
cd "$(dirname "$0")"
[ -d .git ] || git init -q -b main
git add . && git -c user.name=Abomaerd -c user.email=abouslimi@highgatesystems.com commit -qm "Add app-ads.txt for AdMob" || true
gh repo create Abomaerd/Abomaerd.github.io --public --source . --push --description "ABOSGATE website (app-ads.txt)"
gh api -X POST repos/Abomaerd/Abomaerd.github.io/pages -f "source[branch]=main" -f "source[path]=/" --jq .html_url
echo "OK -> https://abomaerd.github.io/app-ads.txt (live in ~1-2 min)"
