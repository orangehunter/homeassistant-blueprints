# 快速開始指南

## 步驟 1：建立 Timer Entity

在你的 Home Assistant `configuration.yaml` 中加入：

```yaml
timer:
  zbmini_switch_timer:
    duration: "00:00:01"
```

重新啟動 Home Assistant。

## 步驟 2：匯入藍圖

### 使用 ZHA（推薦）

1. 點擊下方按鈕直接匯入：

   [![Open your Home Assistant instance and show the blueprint import dialog with a specific blueprint pre-filled.](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https%3A%2F%2Fraw.githubusercontent.com%2Forangehunter%2Fhomeassistant-blueprints%2Fmain%2Fblueprints%2Fautomation%2Forangehunter%2Fzbmini_tri_step_dim_or_off.yaml)

2. 或手動輸入 URL：
   ```
   https://raw.githubusercontent.com/orangehunter/homeassistant-blueprints/main/blueprints/automation/orangehunter/zbmini_tri_step_dim_or_off.yaml
   ```

### 使用 Zigbee2MQTT

1. 點擊下方按鈕直接匯入：

   [![Open your Home Assistant instance and show the blueprint import dialog with a specific blueprint pre-filled.](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https%3A%2F%2Fraw.githubusercontent.com%2Forangehunter%2Fhomeassistant-blueprints%2Fmain%2Fblueprints%2Fautomation%2Forangehunter%2Fzbmini_tri_step_dim_or_off_z2m.yaml)

2. 或手動輸入 URL：
   ```
   https://raw.githubusercontent.com/orangehunter/homeassistant-blueprints/main/blueprints/automation/orangehunter/zbmini_tri_step_dim_or_off_z2m.yaml
   ```

## 步驟 3：建立自動化

1. 進入 **設定** → **自動化與場景** → **藍圖**
2. 找到 **ZBMini R2 Tri-Step Dimming or Off**
3. 點擊 **建立自動化**
4. **新增觸發條件**：
   - 點擊 **新增觸發條件** → **裝置**
   - 選擇你的 ZBMini R2 裝置
   - 選擇觸發動作（toggle、on、off 等）
5. 填寫其他設定：
   - 選擇目標燈光
   - 選擇 `timer.zbmini_switch_timer`
   - 設定亮度（例如：`30,60,100`）
6. 儲存自動化

## 步驟 4：測試

- **快速切動兩次**：看燈光是否循環亮度
- **單次切動**：等 1 秒後燈光應該切換開關狀態（開→關 或 關→開）

## 疑難排解

如果無法正常運作：

1. **檢查 ZBMini 模式**
   - 確認已設定為 Detach 模式
   - 在 ZHA 裝置設定中查看

2. **檢查 Timer**
   - 確認 `timer.zbmini_switch_timer` 存在
   - 進入 **開發者工具** → **狀態**，搜尋 `timer.zbmini_switch_timer`

3. **查看日誌**
   - 進入 **設定** → **系統** → **日誌**
   - 查看是否有相關錯誤訊息

4. **測試事件**
   - 進入 **開發者工具** → **事件**
   - 監聽 `zha_event`（ZHA）或 MQTT 事件（Z2M）
   - 切動開關，確認有事件觸發

---

**記得將所有 `orangehunter` 替換為你的 GitHub 使用者名稱！**
