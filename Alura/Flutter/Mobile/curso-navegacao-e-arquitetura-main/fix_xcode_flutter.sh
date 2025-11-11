#!/bin/bash

set -e

echo "🧹 Limpando caches do Xcode..."
rm -rf ~/Library/Developer/Xcode/DerivedData
rm -rf ~/Library/Developer/Xcode/ModuleCache.noindex
rm -rf ~/Library/Developer/Xcode/Products
rm -rf ~/Library/Developer/Xcode/Archives

echo "🧽 Limpando build do Flutter..."
flutter clean

echo "📦 Atualizando dependências do Flutter..."
flutter pub get

echo "🧩 Limpando Pods..."
cd ios || exit
pod deintegrate
rm -rf Pods Podfile.lock

echo "🔄 Atualizando repositórios do CocoaPods..."
pod repo update

echo "📥 Instalando Pods novamente..."
pod install

cd ..

echo "🛠️ Garantindo que o Xcode está configurado corretamente..."
sudo xcode-select --switch /Applications/Xcode.app
sudo xcodebuild -license accept

echo "🚀 Limpando e reconstruindo projeto no Xcode..."
xcodebuild -version
xcodebuild clean -workspace ios/Runner.xcworkspace -scheme Runner -configuration Debug

echo "✅ Processo finalizado com sucesso!"
echo "Agora você pode abrir o projeto com:"
echo "  open ios/Runner.xcworkspace"
echo "E executar normalmente via Xcode ou rodar:"
echo "  flutter run"
