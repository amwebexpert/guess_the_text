echo "Step 1) flutter Clean"
flutter clean

echo "Step 2) flutter pub get"
flutter pub get

echo "Step 3) flutter build web"
flutter build web --release --base-href=/guess_the_text/
