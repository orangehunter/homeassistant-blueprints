# GitHub Repository 設定指南

## 準備工作

1. **確認你的 GitHub 使用者名稱**
   - 登入 GitHub
   - 查看你的個人檔案 URL：`https://github.com/YOUR_USERNAME`
   - 記下你的使用者名稱

2. **全域搜尋並替換**
   - 在所有檔案中將 `orangehunter` 替換為你的實際使用者名稱
   - 可使用 VS Code 的 Ctrl+Shift+H（全域搜尋替換）功能

## 建立 GitHub Repository

### 方法 1：使用 GitHub 網頁介面

1. 登入 [GitHub](https://github.com)
2. 點擊右上角的 **+** → **New repository**
3. 設定如下：
   - **Repository name**: `homeassistant-blueprints`
   - **Description**: `Home Assistant automation blueprints collection`
   - **Public** ✅（必須公開才能讓 Home Assistant 匯入）
   - **不要**勾選 "Initialize this repository with a README"
4. 點擊 **Create repository**

### 方法 2：使用 GitHub CLI（如已安裝）

```powershell
gh repo create homeassistant-blueprints --public --description "Home Assistant automation blueprints collection"
```

## 推送到 GitHub

在此專案目錄下開啟 PowerShell，執行以下命令：

```powershell
# 初始化 Git repository
git init

# 設定預設分支為 main
git branch -M main

# 加入所有檔案
git add .

# 建立初始 commit
git commit -m "Initial commit: ZBMini R2 tri-step dimming blueprint"

# 加入遠端 repository（請替換 orangehunter）
git remote add origin https://github.com/orangehunter/homeassistant-blueprints.git

# 推送到 GitHub
git push -u origin main
```

## 驗證 Raw URL

推送成功後，確認以下 URL 可以訪問：

**ZHA 版本：**
```
https://raw.githubusercontent.com/orangehunter/homeassistant-blueprints/main/blueprints/automation/orangehunter/zbmini_tri_step_dim_or_off.yaml
```

**Zigbee2MQTT 版本：**
```
https://raw.githubusercontent.com/orangehunter/homeassistant-blueprints/main/blueprints/automation/orangehunter/zbmini_tri_step_dim_or_off_z2m.yaml
```

在瀏覽器中開啟這些 URL，應該會看到 YAML 檔案內容。

## 在 Home Assistant 中匯入

現在你可以在 Home Assistant 中使用這些 Raw URL 匯入藍圖了！

1. 進入 **設定** → **自動化與場景** → **藍圖**
2. 點擊右下角的 **匯入藍圖**
3. 貼上上述 Raw URL
4. 點擊 **預覽藍圖** → **匯入藍圖**

## 故障排除

### 推送失敗：authentication required

使用以下任一方式認證：

**方式 1：使用 Personal Access Token**
```powershell
# 產生 token：GitHub → Settings → Developer settings → Personal access tokens → Generate new token
# 選擇權限：repo (完整)
# 複製 token

# 使用 token 推送（輸入密碼時貼上 token）
git push -u origin main
```

**方式 2：使用 SSH**
```powershell
# 設定 SSH key（如未設定）
ssh-keygen -t ed25519 -C "your_email@example.com"

# 將公鑰加入 GitHub
# 複製 ~/.ssh/id_ed25519.pub 內容
# GitHub → Settings → SSH and GPG keys → New SSH key

# 更改 remote URL
git remote set-url origin git@github.com:orangehunter/homeassistant-blueprints.git

# 推送
git push -u origin main
```

### Repository 已存在但是空的

如果你已經建立了 repository 但沒有初始化：

```powershell
git init
git branch -M main
git add .
git commit -m "Initial commit: ZBMini R2 tri-step dimming blueprint"
git remote add origin https://github.com/orangehunter/homeassistant-blueprints.git
git push -u origin main
```

### Repository 已有內容

如果 repository 已經有內容，先 pull 再 push：

```powershell
git pull origin main --allow-unrelated-histories
git push -u origin main
```

## 完成！

你的 Home Assistant Blueprint 現在已經公開在 GitHub 上了！ 🎉

可以分享 Raw URL 給其他人，讓他們也能使用你的藍圖。
