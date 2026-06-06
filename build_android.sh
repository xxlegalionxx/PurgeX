#!/bin/bash

# Script de compilation Android APK pour PurgeX
# Usage: bash build_android.sh

echo "🚀 Démarrage de la compilation Android APK..."
echo ""

# Vérifier que Flutter est installé
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter n'est pas installé ou non trouvé dans le PATH"
    exit 1
fi

echo "✅ Flutter trouvé"
echo ""

# Étape 1 : Clean
echo "🧹 Nettoyage du projet..."
flutter clean
echo ""

# Étape 2 : Pub get
echo "📦 Installation des dépendances..."
flutter pub get
echo ""

# Étape 3 : Build APK Release
echo "🏗️  Compilation de l'APK Release..."
flutter build apk --release

echo ""
echo "✅ Compilation terminée!"
echo ""
echo "📁 APK généré à: build/app/outputs/flutter-apk/app-release.apk"
echo ""
echo "📊 Taille approximative: 30-40 MB"
echo ""
echo "🚀 Prêt à être installé sur Android!"
