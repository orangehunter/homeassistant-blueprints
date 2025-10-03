# ZBMini R2 Tri-Step Dimming Blueprint

使用 SONOFF ZBMini R2 在 Detach 模式下實現智能調光控制。

## 功能

- **單次切動**：等 1 秒後切換燈的開關（開↔關）
- **雙擊**（1 秒內）：循環調整亮度 50% → 75% → 100% → 50%...
- **漸變效果**：亮度變化有平滑過渡（預設 1 秒）
- **可自訂亮度**：預設 50,75,100，可自行修改
- **可調整漸變時間**：0-5 秒，步進 0.1 秒
- **支援多裝置**：使用 timer entity 避免衝突

## 支援版本

- ✅ ZHA (Zigbee Home Automation)
- ✅ Zigbee2MQTT

## 匯入藍圖

**ZHA 版本**
```
https://raw.githubusercontent.com/orangehunter/homeassistant-blueprints/main/blueprints/automation/orangehunter/zbmini_tri_step_dim_or_off.yaml
```

**Zigbee2MQTT 版本**
```
https://raw.githubusercontent.com/orangehunter/homeassistant-blueprints/main/blueprints/automation/orangehunter/zbmini_tri_step_dim_or_off_z2m.yaml
```

## 使用前準備

### 1. 建立 Timer
在 `configuration.yaml` 加入：
```yaml
timer:
  zbmini_switch_timer:
    duration: "00:00:01"
```

### 2. 設定 Detach Mode
進入 ZHA 裝置設定，將 ZBMini R2 設為 **Detach** 模式。

## 建立自動化

1. 匯入藍圖（使用上方 URL）
2. 建立自動化
3. 設定參數：
   - **ZBMini Toggle Action**：選擇你的 ZBMini R2 裝置的 toggle 動作
   - **Target Light**：選擇要控制的燈光
   - **Timer Entity**：`timer.zbmini_switch_timer`
   - **Brightness Levels**：`50,75,100`（可自訂）
   - **Transition Time**：`1` 秒（可調整 0-5 秒）

## 故障排除

- **無法觸發**：確認 Detach 模式已啟用
- **亮度錯誤**：檢查格式，用逗號分隔（例：`50,75,100`）

## 授權

MIT License
