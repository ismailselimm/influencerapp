# ================================================
# Kuwa App Çalıştırma Scripti
# ================================================

$FVM_PATH = "C:\Users\emreg\AppData\Local\Pub\Cache\bin\fvm.bat"

Write-Host "🚀 Kuwa App başlatılıyor..." -ForegroundColor Green

# Device seçimi
Write-Host "📱 Mevcut cihazlar kontrol ediliyor..." -ForegroundColor Blue
& $FVM_PATH flutter devices

Write-Host "`n🎯 Uygulama başlatılıyor..." -ForegroundColor Blue

# Chrome'da çalıştır
try {
    Write-Host "🌐 Chrome'da başlatılıyor..." -ForegroundColor Cyan
    & $FVM_PATH flutter run -d chrome --web-port=8080
}
catch {
    Write-Host "⚠️ Chrome başarısız. Android'de deneniyor..." -ForegroundColor Yellow
    
    # Android'de çalıştır
    try {
        Write-Host "📱 Android'de başlatılıyor..." -ForegroundColor Cyan
        & $FVM_PATH flutter run -d android
    }
    catch {
        Write-Host "❌ Hiçbir cihaz bulunamadı!" -ForegroundColor Red
        Write-Host "Çözümler:" -ForegroundColor Yellow
        Write-Host "• Android Studio'da emulator başlatın" -ForegroundColor White
        Write-Host "• Chrome tarayıcısını güncelleyin" -ForegroundColor White
        Write-Host "• flutter devices komutunu kontrol edin" -ForegroundColor White
    }
}



