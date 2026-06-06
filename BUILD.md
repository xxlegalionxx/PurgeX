# Guide de Compilation PurgeX

## 📱 Compiler pour Android (APK)

### Option 1 : Utiliser le script (Recommandé)

#### Sur Linux/Mac :
```bash
chmod +x build_android.sh
./build_android.sh
```

#### Sur Windows :
```bash
build_android.sh  # Si Git Bash est installé
# Sinon, utiliser les commandes manuelles ci-dessous
```

### Option 2 : Commandes Manuelles

```bash
cd PurgeX

# Nettoyer les builds précédents
flutter clean

# Installer les dépendances
flutter pub get

# Compiler APK Release
flutter build apk --release

# APK généré à :
# build/app/outputs/flutter-apk/app-release.apk
```

### Résultat
- **Fichier** : `app-release.apk`
- **Taille** : 30-40 MB
- **Installation** : Copier sur téléphone et ouvrir avec gestionnaire fichiers

---

## 🪟 Compiler pour Windows (EXE)

### Prérequis Obligatoires

1. **Visual Studio 2019+** avec C++ compiler
   - Télécharger : https://visualstudio.microsoft.com/downloads/
   - Sélectionner : "Desktop development with C++"

2. **Flutter 3.10+**
   - Vérifier : `flutter --version`

3. **Windows 10/11**

### Option 1 : Utiliser le script (Recommandé)

```bash
build_windows.bat
```

Le script va :
- ✅ Vérifier Visual Studio
- ✅ Activer Windows Desktop
- ✅ Nettoyer le projet
- ✅ Compiler l'EXE

### Option 2 : Commandes Manuelles

```bash
cd PurgeX

# Activer support Windows Desktop
flutter config --enable-windows-desktop

# Nettoyer
flutter clean

# Installer dépendances
flutter pub get

# Compiler EXE Release
flutter build windows --release

# EXE généré à :
# build/windows/runner/Release/purgex.exe
```

### Résultat
- **Fichier** : `purgex.exe`
- **Taille** : 200-300 MB
- **Installation** : Double-cliquer pour exécuter

---

## 🏗️ Build Types

### Debug (Rapide, pour développement)
```bash
# Android
flutter build apk --debug

# Windows
flutter build windows --debug
```

### Release (Optimisée, pour production)
```bash
# Android
flutter build apk --release

# Windows
flutter build windows --release
```

### App Bundle (Pour Google Play Store)
```bash
flutter build appbundle --release
# Généré : build/app/outputs/bundle/release/app-release.aab
```

---

## 📊 Localisation des Fichiers Compilés

| Platform | Type | Chemin |
|----------|------|--------|
| **Android** | APK Debug | `build/app/outputs/flutter-apk/app-debug.apk` |
| **Android** | APK Release | `build/app/outputs/flutter-apk/app-release.apk` |
| **Android** | App Bundle | `build/app/outputs/bundle/release/app-release.aab` |
| **Windows** | EXE Debug | `build/windows/runner/Debug/purgex.exe` |
| **Windows** | EXE Release | `build/windows/runner/Release/purgex.exe` |

---

## 🔑 Configuration Avancée

### Signature APK pour Google Play

```bash
# 1. Créer une clé de signature
keytool -genkey -v -keystore my-release-key.keystore \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias my-key-alias

# 2. Créer android/key.properties
cat > android/key.properties << EOF
storePassword=<mot de passe>
keyPassword=<mot de passe clé>
keyAlias=my-key-alias
storeFile=../my-release-key.keystore
EOF

# 3. Build APK signé
flutter build apk --release
```

### Créer un Installateur Windows

Tu peux utiliser **Inno Setup** pour créer un installateur professionnel :

1. Télécharger : https://jrsoftware.org/isdl.php
2. Créer un script `.iss` avec l'EXE généré
3. Générer `PurgeX-Setup.exe`

---

## ⚙️ Configuration Requise

### Pour Android
- **Android SDK** : API 21+
- **Target API** : 31+
- **Java** : JDK 11+

### Pour Windows
- **Windows** : 10/11
- **Visual Studio** : 2019+
- **C++ Compiler** : MSVC

### Tous
- **Flutter** : 3.10+
- **Dart** : 3.0+
- **RAM** : 4GB minimum
- **Espace disque** : 5GB minimum

---

## 🐛 Troubleshooting

### Android

**Problème** : "SDK not found"
```bash
# Solution : Installer Android SDK
flutter doctor --android-licenses
flutter doctor
```

**Problème** : "Target API too low"
```bash
# Solution : Utiliser --target-platform
flutter build apk --target-platform android-arm64 --release
```

### Windows

**Problème** : "Visual Studio not found"
```bash
# Solution : Installer Visual Studio 2019+
flutter doctor
# Vérifier que C++ compiler est actif
```

**Problème** : "Windows desktop not enabled"
```bash
# Solution :
flutter config --enable-windows-desktop
flutter doctor
```

---

## 📦 Distribution

### Android - Google Play Store
1. Créer compte Google Play Developer (25$)
2. Uploader `app-release.aab`
3. Remplir infos (description, screenshots, etc.)
4. Soumettre pour review

### Windows - GitHub Releases
1. Créer une Release sur GitHub
2. Uploader `purgex.exe`
3. Partager le lien

---

## ✅ Vérifier la Compilation

### Android
```bash
# Vérifier APK
unzip -l build/app/outputs/flutter-apk/app-release.apk | head -20

# Taille
du -h build/app/outputs/flutter-apk/app-release.apk
```

### Windows
```bash
# Vérifier EXE
file build/windows/runner/Release/purgex.exe

# Taille
ls -lh build/windows/runner/Release/purgex.exe
```

---

## 🎯 Commande Rapide

```bash
# Build tout en un
flutter clean && flutter pub get && flutter build apk --release && flutter build windows --release
```

---

**Version** : 1.0.0 | **Auteur** : xxlegalionxx | **Date** : 2026-06-06
