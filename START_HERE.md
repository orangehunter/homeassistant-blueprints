# 🚀 開始使用

歡迎使用 Home Assistant Blueprints！請依照以下步驟開始：

## ⚠️ 重要：第一步

**你必須先替換所有檔案中的 `orangehunter`！**

### 方式 1：使用自動腳本（推薦）

在此目錄下開啟 PowerShell，執行：

```powershell
.\replace-username.ps1 -Username "你的GitHub使用者名稱"
```

例如：
```powershell
.\replace-username.ps1 -Username "john-doe"
```

### 方式 2：手動替換

1. 在 VS Code 中按 `Ctrl+Shift+H` 開啟全域搜尋替換
2. 搜尋：`orangehunter`
3. 替換為：你的 GitHub 使用者名稱
4. 點擊「全部替換」
5. 手動重新命名目錄：
   ```
   blueprints/automation/orangehunter/
   → blueprints/automation/你的使用者名稱/
   ```

---

## 📋 檢查清單

完成替換後，請確認：

- [ ] 所有 `.md` 檔案中的 `orangehunter` 已替換
- [ ] 所有 `.yaml` 檔案中的 `orangehunter` 已替換
- [ ] 目錄已重新命名為你的使用者名稱
- [ ] GitHub repository 已建立（參考 `GITHUB_SETUP.md`）

---

## 📚 文件導覽

| 文件 | 用途 |
|------|------|
| **README.md** | 📖 完整的專案說明文件 |
| **QUICKSTART.md** | ⚡ 快速開始指南（3 分鐘設定完成） |
| **GITHUB_SETUP.md** | 🐙 GitHub 建立與推送教學 |
| **PROJECT_STRUCTURE.md** | 📁 專案結構說明 |
| **START_HERE.md** | 👉 此檔案 |

---

## ⚠️ 重要提示

**此 Blueprint 需要手動新增觸發條件！**

這個設計提供更大的靈活性，讓你可以：
- 選擇任何裝置作為觸發來源
- 新增多個觸發條件
- 不限定特定品牌或型號

詳細說明請參考：[觸發條件設定指南 (TRIGGER_GUIDE.md)](TRIGGER_GUIDE.md)

---

## 🎯 快速流程

1. **替換使用者名稱**（使用上方腳本或手動）
2. **建立 GitHub Repository**
   ```powershell
   # 初始化 Git
   git init
   git branch -M main
   git add .
   git commit -m "Initial commit: ZBMini R2 blueprint"
   
   # 加入遠端並推送（替換為你的使用者名稱）
   git remote add origin https://github.com/你的使用者名稱/homeassistant-blueprints.git
   git push -u origin main
   ```

3. **在 Home Assistant 中匯入**
   - 進入：**設定** → **自動化與場景** → **藍圖** → **匯入藍圖**
   - 貼上你的 Raw URL（參考 README.md）

4. **設定 Timer**（在 `configuration.yaml` 中）
   ```yaml
   timer:
     zbmini_switch_timer:
       duration: "00:00:01"
   ```

5. **建立自動化並測試**

---

## 🆘 需要幫助？

- 詳細設定步驟：查看 `QUICKSTART.md`
- GitHub 推送問題：查看 `GITHUB_SETUP.md`
- 功能說明與故障排除：查看 `README.md`

---

## 🎉 完成後

你會得到：

✅ 一個符合規範的 Home Assistant Blueprint  
✅ 公開的 GitHub Repository  
✅ 可分享的匯入 URL  
✅ 完整的文件與範例  

開始你的 Smart Home 自動化之旅吧！🏠✨
