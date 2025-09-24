# ================================================
# FVM Flutter 3.24.3 Setup for Kuwa App
# ================================================

$FVM_PATH = "C:\Users\emreg\AppData\Local\Pub\Cache\bin\fvm.bat"
$FLUTTER_VERSION = "3.24.3"

Write-Host "🔧 FVM Flutter Setup Başlıyor..." -ForegroundColor Green

# 1️⃣ Flutter 3.24.3 kurulumu
Write-Host "📦 Flutter $FLUTTER_VERSION kuruluyor (arka planda)..." -ForegroundColor Blue
try {
    Start-Process -FilePath $FVM_PATH -ArgumentList "install", $FLUTTER_VERSION -Wait -NoNewWindow
    Write-Host "✅ Flutter $FLUTTER_VERSION kuruldu" -ForegroundColor Green
}
catch {
    Write-Host "⚠️ Flutter kurulumu devam ediyor..." -ForegroundColor Yellow
}

# 2️⃣ Proje için sürüm ayarlama
Write-Host "🎯 Proje için Flutter sürümü ayarlanıyor..." -ForegroundColor Blue
try {
    & $FVM_PATH use $FLUTTER_VERSION --force
    Write-Host "✅ Proje Flutter $FLUTTER_VERSION olarak ayarlandı" -ForegroundColor Green
}
catch {
    Write-Host "⚠️ FVM use komutu başarısız" -ForegroundColor Yellow
}

# 3️⃣ Dependencies güncellemesi
Write-Host "📦 Dependencies güncelleniyor..." -ForegroundColor Blue
try {
    & $FVM_PATH flutter pub get
    Write-Host "✅ Dependencies güncellendi" -ForegroundColor Green
}
catch {
    Write-Host "⚠️ Pub get başarısız" -ForegroundColor Yellow
}

# 4️⃣ Code generation
Write-Host "🔧 Code generation..." -ForegroundColor Blue
try {
    & $FVM_PATH dart run build_runner build --delete-conflicting-outputs
    Write-Host "✅ Code generation tamamlandı" -ForegroundColor Green
}
catch {
    Write-Host "⚠️ Code generation atlandı" -ForegroundColor Yellow
}

# 5️⃣ Version kontrolü
Write-Host "📋 Version kontrolü..." -ForegroundColor Blue
Write-Host "Global Flutter:" -ForegroundColor Cyan
flutter --version

Write-Host "`nFVM Flutter:" -ForegroundColor Cyan
& $FVM_PATH flutter --version

Write-Host "`n🎉 Kurulum tamamlandı!" -ForegroundColor Green
Write-Host "Artık uygulamayı şu komutla çalıştırabilirsiniz:" -ForegroundColor Yellow
Write-Host "fvm flutter run" -ForegroundColor White



