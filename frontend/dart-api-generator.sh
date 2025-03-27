openapi-generator-cli generate -i ../swagger.yaml -g dart-dio -o api -c config.yaml

cd api
dart format .
dart pub add dev:json_serializable:6.8.0
flutter pub get 
# flutter pub upgrade
dart run build_runner build --delete-conflicting-outputs