# 使用者名稱替換腳本
# 此腳本會將所有檔案中的 YOUR_GITHUB_USERNAME 替換為你的實際 GitHub 使用者名稱

param(
    [Parameter(Mandatory=$true)]
    [string]$Username
)

Write-Host "正在將 YOUR_GITHUB_USERNAME 替換為: $Username" -ForegroundColor Green

# 定義要處理的檔案類型
$fileTypes = @("*.md", "*.yaml", "*.yml")

# 取得所有符合的檔案
$files = Get-ChildItem -Path . -Include $fileTypes -Recurse -File

$count = 0
foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    if ($content -match "YOUR_GITHUB_USERNAME") {
        $newContent = $content -replace "YOUR_GITHUB_USERNAME", $Username
        Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8 -NoNewline
        Write-Host "✓ 已更新: $($file.FullName)" -ForegroundColor Cyan
        $count++
    }
}

Write-Host "`n已成功更新 $count 個檔案" -ForegroundColor Green

# 重新命名目錄
$oldDirPath = ".\blueprints\automation\YOUR_GITHUB_USERNAME"
$newDirPath = ".\blueprints\automation\$Username"

if (Test-Path $oldDirPath) {
    Rename-Item -Path $oldDirPath -NewName $Username
    Write-Host "✓ 已重新命名目錄: blueprints\automation\$Username" -ForegroundColor Cyan
}

Write-Host "`n完成！現在可以執行以下命令推送到 GitHub：" -ForegroundColor Yellow
Write-Host "git add ." -ForegroundColor White
Write-Host "git commit -m 'Update username to $Username'" -ForegroundColor White
Write-Host "git remote add origin https://github.com/$Username/homeassistant-blueprints.git" -ForegroundColor White
Write-Host "git push -u origin main" -ForegroundColor White
