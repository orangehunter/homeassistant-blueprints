# ZHA vs Zigbee2MQTT 版本比較

## 相同點

兩個版本的功能完全相同：
- ✅ 單次切動：toggle 燈光開關
- ✅ 雙擊（1 秒內）：循環調整亮度 30% → 60% → 100%
- ✅ 使用 timer entity 避免衝突
- ✅ 可自訂三檔亮度
- ✅ 都使用裝置選擇器（device selector）

## 差異點

### ZHA 版本 (`zbmini_tri_step_dim_or_off.yaml`)

**裝置選擇器：**
```yaml
selector:
  device:
    integration: zha
    manufacturer: SONOFF
    model: ZBMINIR2
```

**Trigger 方式：**
```yaml
trigger:
  - platform: event
    event_type: zha_event
    event_data:
      device_id: !input zbmini_device

condition:
  - condition: template
    value_template: >
      {{ trigger.event.data.command in ['on', 'off', 'toggle'] }}
```

**說明：**
- 使用 ZHA event 系統
- 透過 `zha_event` 事件類型接收裝置動作
- 需要條件判斷來過濾 command

---

### Zigbee2MQTT 版本 (`zbmini_tri_step_dim_or_off_z2m.yaml`)

**裝置選擇器：**
```yaml
selector:
  device:
    integration: mqtt
    manufacturer: SONOFF
    model: ZBMINIR2
```

**Trigger 方式：**
```yaml
trigger:
  - platform: device
    device_id: !input zbmini_device
    domain: mqtt
    type: action
    subtype: toggle
```

**說明：**
- 使用 MQTT device trigger
- 直接指定 action type 和 subtype
- 更簡潔，不需要額外的條件判斷

---

## 使用場景

### 選擇 ZHA 版本如果：
- ✅ 你使用 Home Assistant 的 ZHA 整合
- ✅ 你的 Zigbee 裝置透過 ZHA 連接
- ✅ 不需要外部 MQTT broker

### 選擇 Zigbee2MQTT 版本如果：
- ✅ 你使用 Zigbee2MQTT 整合
- ✅ 你有 MQTT broker（例如 Mosquitto）
- ✅ 你想要更多 Zigbee 裝置的支援和自訂選項

---

## 匯入 URL

### ZHA 版本
```
https://raw.githubusercontent.com/orangehunter/homeassistant-blueprints/main/blueprints/automation/orangehunter/zbmini_tri_step_dim_or_off.yaml
```

### Zigbee2MQTT 版本
```
https://raw.githubusercontent.com/orangehunter/homeassistant-blueprints/main/blueprints/automation/orangehunter/zbmini_tri_step_dim_or_off_z2m.yaml
```

---

## 效能比較

兩個版本的效能基本相同：
- **反應速度**：相同（取決於網路延遲）
- **資源使用**：相同
- **穩定性**：相同

選擇哪個版本完全取決於你使用的 Zigbee 整合方式。
