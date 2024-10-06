#!/bin/bash

# Cambia al directorio raíz del proyecto (esto asume que tu script está en 'scripts')
cd "$(dirname "$0")/.."

# Comprueba si el archivo pubspec.yaml existe en el directorio actual
if [ ! -f pubspec.yaml ]; then
  echo "Error: pubspec.yaml no encontrado en el directorio actual."
  exit 1
fi

# Obtener la versión actual
version=$(grep 'version:' pubspec.yaml | sed 's/version: //')
echo "Versión actual: $version"

IFS='+' read -r semver build_number <<< "$version"

if [ -z "$build_number" ]; then
  build_number=1
else
  build_number=$((build_number + 1))
fi

new_version="$semver+$build_number"
echo "Nueva versión: $new_version"

# Usar sed para actualizar el pubspec.yaml
# La forma de usar sed puede variar según el sistema operativo
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  sed -i '' "s/version: .*/version: $new_version/" pubspec.yaml
else
  # Linux
  sed -i "s/version: .*/version: $new_version/" pubspec.yaml
fi
