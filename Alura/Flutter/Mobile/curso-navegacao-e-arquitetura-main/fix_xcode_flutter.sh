#!/bin/bash

set -e

# Caminhos das versões do Xcode
XCODE_FLUTTER="/Applications/Xcode_16.3.app/Contents/Developer"
XCODE_RN="/Applications/Xcode.app/Contents/Developer"

echo "🚀 Iniciando limpeza e build do Flutter usando Xcode 16.3..."

# --- Troca temporária para o Xcode 16.3 ---
echo "🔄 Alterando Xcode ativo para 16.3..."
sudo xcode-select --switch "$XCODE_FLUTTER"
sudo xcodebuild -license accept

# --- Limpeza de caches específicos do Xcode 16.3 ---
echo "🧹 Limpando caches do Xcode 16.3..."
rm -rf ~/Library/Developer/Xcode/DerivedData
rm -rf ~/Library/Developer/Xcode/ModuleCache.noindex
rm -rf ~/Library/Developer/Xcode/Products
rm -rf ~/Library/Developer/Xcode/Archives

# --- Flutter ---
echo "🧽 Limpando build do Flutter..."
flutter clean

echo "📦 Atualizando dependências do Flutter..."
flutter pub get

# --- CocoaPods ---
echo "🧩 Limpando Pods..."
cd ios || exit
pod deintegrate
rm -rf Pods Podfile.lock

echo "🔄 Atualizando repositórios do CocoaPods..."
pod repo update

echo "📥 Instalando Pods novamente..."
pod install

cd ..

# --- Compilação de verificação ---
echo "🛠️ Verificando Xcode ativo..."
xcodebuild -version

echo "🧱 Limpando projeto no Xcode..."
xcodebuild clean -workspace ios/Runner.xcworkspace -scheme Runner -configuration Debug

echo "✅ Processo Flutter finalizado com sucesso!"
echo "Agora você pode abrir o projeto com:"
echo "  open ios/Runner.xcworkspace"
echo "Ou executar via linha de comando:"
echo "  flutter run"

# --- Retorna o Xcode padrão (React Native / 16.2) ---
echo "↩️ Revertendo para Xcode 16.2 (React Native)..."
sudo xcode-select --switch "$XCODE_RN"
sudo xcodebuild -license accept

echo "🎯 Xcode restaurado para 16.2 com sucesso!"
