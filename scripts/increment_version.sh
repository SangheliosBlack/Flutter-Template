#!/bin/bash

version=$(grep 'version:' ../pubspec.yaml | sed 's/version: //')
echo "Versión actual: $version"

IFS='+' read -r semver build_number <<< "$version"

if [ -z "$build_number" ]; then
  build_number=1
else
  build_number=$((build_number + 1))
fi

new_version="$semver+$build_number"
echo "Nueva versión: $new_version"

sed -i '' "s/version: .*/version: $new_version/" ../pubspec.yaml
