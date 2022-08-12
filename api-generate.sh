#!/bin/sh
openapi-generator generate -i swagger/swagger.json -g dart-dio -c swagger/openapi-generator.yaml  -o ./openapi
cd openapi
flutter pub get
flutter pub run build_runner build
cd ..
