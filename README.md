# Home Assistant Blueprints

這個 Repository 包含我的 Home Assistant 自動化藍圖集合。

## 📋 藍圖列表

### ZBMini R2 Tri-Step Dimming or Off (Detach Mode)

使用 SONOFF ZBMini R2 在 Detach 模式下控制燈光的智能藍圖。

**功能特色：**
- 第一次切動開關：啟動 1 秒計時器
- 1 秒內第二次切動：依三檔亮度循環（預設：30%, 60%, 100%）
- 如果沒有第二次切動：計時器結束後切換燈的開關狀態
- 可自訂三檔亮度等級
- 使用 timer entity 避免多裝置衝突
- 提供 ZHA 和 Zigbee2MQTT 兩個版本

**支援版本：**
- ✅ ZHA (Zigbee Home Automation)
- ✅ Zigbee2MQTT

---

## 🚀 如何匯入藍圖

### 方法 1：使用 Raw URL 匯入（推薦）

1. 在 Home Assistant 中，進入 **設定** → **自動化與場景** → **藍圖**
2. 點擊右下角的 **匯入藍圖** 按鈕
3. 貼上以下 URL（依你使用的整合選擇）：

#### ZHA 版本
```
https://raw.githubusercontent.com/orangehunter/homeassistant-blueprints/main/blueprints/automation/orangehunter/zbmini_tri_step_dim_or_off.yaml
```

#### Zigbee2MQTT 版本
```
https://raw.githubusercontent.com/orangehunter/homeassistant-blueprints/main/blueprints/automation/orangehunter/zbmini_tri_step_dim_or_off_z2m.yaml
```

4. 點擊 **預覽藍圖** → **匯入藍圖**

### 方法 2：手動下載

1. 下載對應的 YAML 檔案
2. 放置到你的 Home Assistant 設定目錄：
   ```
   config/blueprints/automation/orangehunter/
   ```
3. 重新啟動 Home Assistant

---

## ⚙️ 使用前準備

### 建立 Timer Entity

在使用此藍圖前，你需要在 `configuration.yaml` 中建立一個 timer entity：

```yaml
timer:
  zbmini_switch_timer:
    duration: "00:00:01"
```

然後重新啟動 Home Assistant。

### ZBMini R2 設定為 Detach Mode

確保你的 ZBMini R2 已設定為 Detach 模式（開關與繼電器分離）。

**在 ZHA 中設定：**
1. 進入 **設定** → **裝置與服務** → **ZHA**
2. 找到你的 ZBMini R2 裝置
3. 點擊 **重新設定裝置**
4. 在設定選項中找到 **Switch Mode** 或 **Operation Mode**
5. 選擇 **Detach** 或 **External Switch**

---

## 📖 使用說明

### 建立自動化

1. 進入 **設定** → **自動化與場景** → **藍圖**
2. 找到 **ZBMini R2 Tri-Step Dimming or Off** 藍圖
3. 點擊 **建立自動化**
4. 設定以下參數：
   - **ZBMini R2 Device**：選擇你的 ZBMini R2 裝置（ZHA 或 Zigbee2MQTT 都使用裝置選擇器）
   - **Target Light**：選擇要控制的燈光
   - **Timer Entity**：選擇你建立的 timer（例如：`timer.zbmini_switch_timer`）
   - **Brightness Levels**：自訂亮度（例如：`30,60,100` 或 `20,50,80`）

### 操作方式

- **快速切動兩次**（1 秒內）：循環切換亮度 30% → 60% → 100% → 30% ...
- **單次切動**：等待 1 秒後切換燈的開關狀態（開→關 或 關→開）

---

## 🛠️ 故障排除

### 藍圖無法匯入
- 確認 URL 正確，且已替換 `orangehunter` 為你的 GitHub 使用者名稱
- 檢查網路連線

### 自動化無法觸發
- 確認 ZBMini R2 已設定為 Detach 模式
- 檢查 timer entity 是否已建立
- 查看 Home Assistant 日誌是否有錯誤訊息

### 亮度循環不正確
- 確認亮度設定格式正確（例如：`30,60,100`，用逗號分隔）
- 確認數值介於 1-100 之間

---

## 📝 版本更新

### v1.0.0 (2025-10-03)
- 初始版本發布
- 支援 ZHA 和 Zigbee2MQTT
- 三檔亮度循環功能
- 單次切動切換開關狀態功能

---

## 🤝 貢獻

歡迎提交 Issue 或 Pull Request！

## 📄 授權

MIT License

---

## 🔗 相關連結

- [Home Assistant 官方文件](https://www.home-assistant.io/)
- [Home Assistant 藍圖格式說明](https://www.home-assistant.io/docs/blueprint/)
- [SONOFF ZBMini R2](https://sonoff.tech/product/diy-smart-switches/zbminir2/)

---

**注意：** 請將所有 URL 中的 `orangehunter` 替換為你的 GitHub 使用者名稱。
