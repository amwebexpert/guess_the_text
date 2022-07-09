flutter clean
flutter pub get
flutter build web --release --base-href=/guess_the_text/
cp -R ./build/web/ ./docs

git add .
git commit -m"docs: new online demo web release"
git push
