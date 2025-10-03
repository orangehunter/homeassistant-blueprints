# 更新記錄

## 2025-10-03 更新 v2

### 修正 3：改為手動選擇 Action 來源
**問題：** 在 Blueprint input 中預先定義裝置選擇器會限制使用者的靈活性。

**修正：** 移除裝置選擇器，讓使用者在建立自動化時手動選擇觸發條件
- 使用者可以自由選擇任何裝置和動作作為觸發來源
- 更符合 Home Assistant 的使用習慣
- 提供更大的靈活性

**修改的檔案：**
- `zbmini_tri_step_dim_or_off.yaml`
- `zbmini_tri_step_dim_or_off_z2m.yaml`
- `README.md`
- `QUICKSTART.md`

**技術細節：**
```yaml
# 修改前
input:
  zbmini_device:
    name: ZBMini R2 Device
    selector:
      device:
        integration: zha

trigger:
  - platform: event
    event_type: zha_event
    event_data:
      device_id: !input zbmini_device

# 修改後
input:
  # 移除裝置選擇器

trigger: []  # 空的 trigger，由使用者在 UI 中手動新增
```

**使用方式：**
建立自動化時：
1. 選擇藍圖
2. **手動新增觸發條件** → 裝置 → 選擇 ZBMini R2 → 選擇動作
3. 填寫其他參數（燈光、timer、亮度）

---

## 2025-10-03 更新 v1

### 修正 1：單次切動行為
**問題：** 原本單次切動會「關燈」，但這不符合一般開關的使用邏輯。

**修正：** 改為「切換開關狀態」（toggle）
- 如果燈是關的 → 開燈
- 如果燈是開的 → 關燈

**修改的檔案：**
- `zbmini_tri_step_dim_or_off.yaml`
- `zbmini_tri_step_dim_or_off_z2m.yaml`
- `README.md`
- `QUICKSTART.md`

**技術細節：**
```yaml
# 修改前
- service: light.turn_off

# 修改後
- service: light.toggle
```

---

### 修正 2：Zigbee2MQTT 版本改用裝置選擇器
**問題：** 原本需要手動輸入 MQTT topic（例如：`zigbee2mqtt/zbmini_living_room`），對使用者不友善。

**修正：** 改用裝置選擇器，與 ZHA 版本一致
- 使用者可以直接從下拉選單選擇 ZBMini R2 裝置
- 不需要記住或手動輸入 MQTT topic

**修改的檔案：**
- `zbmini_tri_step_dim_or_off_z2m.yaml`
- `README.md`

**技術細節：**
```yaml
# 修改前
input:
  zbmini_topic:
    name: ZBMini R2 MQTT Topic
    description: The MQTT topic for your ZBMini R2 (e.g., zigbee2mqtt/zbmini_living_room)
    selector:
      text:

trigger:
  - platform: mqtt
    topic: !input zbmini_topic

# 修改後
input:
  zbmini_device:
    name: ZBMini R2 Device
    description: Select the ZBMini R2 device (Zigbee2MQTT)
    selector:
      device:
        integration: mqtt
        manufacturer: SONOFF
        model: ZBMINIR2

trigger:
  - platform: device
    device_id: !input zbmini_device
    domain: mqtt
    type: action
    subtype: toggle
```

**為什麼只用 toggle subtype？**
- 實際使用中，只需要偵測任何開關動作即可
- 簡化設定，避免重複的 trigger
- 符合實際使用情境

---

## 更新後的功能

### 操作邏輯
1. **單次切動**：等待 1 秒 → 切換燈的開關狀態（toggle）
2. **雙擊**（1 秒內切動兩次）：循環調整亮度 30% → 60% → 100% → 30% ...

### 使用方式
- **ZHA 版本**：選擇 ZBMini R2 裝置（從 ZHA 裝置列表）
- **Zigbee2MQTT 版本**：選擇 ZBMini R2 裝置（從 MQTT 裝置列表）

兩個版本現在使用體驗完全一致！

---

## 推送到 GitHub

執行以下命令來推送更新：

```powershell
git add .
git commit -m "修正：1) 單次切動改為 toggle 狀態 2) Z2M 版本改用裝置選擇器"
git push
```
