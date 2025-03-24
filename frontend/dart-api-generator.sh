openapi-generator-cli generate -i ../swagger.yaml -g dart-dio -o api -c config.yaml

cd api
dart format .
flutter pub get 
# flutter pub upgrade
dart run build_runner build --delete-conflicting-outputs