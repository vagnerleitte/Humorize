#!/bin/bash

# Caminho do projeto
PROJECT_NAME="Humorize"
SCHEME_NAME="Humorize"
ARCHIVE_PATH="./build/${PROJECT_NAME}.xcarchive"
IPA_EXPORT_PATH="./build/ipa"
EXPORT_OPTIONS_PLIST="./ExportOptions.plist"

# (1) Apagar build anterior
rm -rf build
mkdir -p "$IPA_EXPORT_PATH"

# (2) Arquivar o app
xcodebuild \
  -scheme "$SCHEME_NAME" \
  -project "${PROJECT_NAME}.xcodeproj" \
  -sdk iphoneos \
  -configuration Release \
  -archivePath "$ARCHIVE_PATH" \
  archive

# (3) Exportar .ipa
xcodebuild \
  -exportArchive \
  -archivePath "$ARCHIVE_PATH" \
  -exportOptionsPlist "$EXPORT_OPTIONS_PLIST" \
  -exportPath "$IPA_EXPORT_PATH"

echo "✅ IPA gerado com sucesso em: $IPA_EXPORT_PATH"
