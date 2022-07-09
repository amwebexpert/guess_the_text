echo "copying ./build/web content ===> ./docs folder ..."
cp -R ./build/web/ ./docs

echo "adding (and pushing) new ./docs file changes to current branch"
git add .
git commit -m"docs: new online demo web release"
git push
