# 專案結構

```
homeassistant-blueprints/
│
├── .git/                              # Git 版本控制目錄
├── .gitignore                         # Git 忽略檔案設定
├── LICENSE                            # MIT 授權條款
├── README.md                          # 主要說明文件（中文）
├── QUICKSTART.md                      # 快速開始指南
├── GITHUB_SETUP.md                    # GitHub 設定與推送指南
├── PROJECT_STRUCTURE.md               # 此檔案
│
├── blueprints/                        # 藍圖主目錄
│   └── automation/                    # 自動化藍圖
│       └── orangehunter/      # 你的 GitHub 使用者名稱目錄
│           ├── zbmini_tri_step_dim_or_off.yaml       # ZHA 版本
│           └── zbmini_tri_step_dim_or_off_z2m.yaml   # Zigbee2MQTT 版本
│
└── examples/                          # 範例設定檔
    └── configuration.yaml             # Home Assistant 設定範例

```

## 檔案說明

### 根目錄檔案

| 檔案 | 說明 |
|------|------|
| `.gitignore` | 定義 Git 忽略的檔案和目錄 |
| `LICENSE` | MIT 開源授權條款 |
| `README.md` | 專案主要說明文件，包含完整功能介紹、使用方法、故障排除 |
| `QUICKSTART.md` | 快速開始指南，提供最精簡的設定步驟 |
| `GITHUB_SETUP.md` | GitHub repository 建立與推送的完整教學 |
| `PROJECT_STRUCTURE.md` | 此檔案，說明專案結構 |

### Blueprint 檔案

| 檔案 | 說明 |
|------|------|
| `zbmini_tri_step_dim_or_off.yaml` | ZHA 版本藍圖，適用於 Zigbee Home Automation 整合 |
| `zbmini_tri_step_dim_or_off_z2m.yaml` | Zigbee2MQTT 版本藍圖，適用於 MQTT 整合 |

### 範例檔案

| 檔案 | 說明 |
|------|------|
| `examples/configuration.yaml` | Home Assistant 設定檔範例，包含 timer entity 設定 |

## 目錄命名規則

根據 Home Assistant Blueprint 規範：

```
blueprints/
└── automation/              # 自動化類型
    └── <github-username>/   # 作者的 GitHub 使用者名稱
        └── <blueprint>.yaml # 藍圖檔案
```

這樣的結構確保：
1. 符合 Home Assistant 官方規範
2. 避免與其他作者的藍圖命名衝突
3. 易於管理和維護多個藍圖

## Raw URL 格式

按照此結構，Raw URL 格式為：

```
https://raw.githubusercontent.com/<github-username>/homeassistant-blueprints/main/blueprints/automation/<github-username>/<blueprint-file>.yaml
```

範例（請替換 orangehunter）：
```
https://raw.githubusercontent.com/orangehunter/homeassistant-blueprints/main/blueprints/automation/orangehunter/zbmini_tri_step_dim_or_off.yaml
```

## 下一步

1. **替換使用者名稱**
   - 在所有檔案中將 `orangehunter` 替換為你的 GitHub 使用者名稱
   - 使用 VS Code 的全域搜尋替換功能（Ctrl+Shift+H）

2. **重新命名目錄**
   - 將 `blueprints/automation/orangehunter/` 重新命名為你的實際使用者名稱

3. **推送到 GitHub**
   - 參考 `GITHUB_SETUP.md` 的說明
   - 建立 GitHub repository
   - 推送程式碼

4. **測試匯入**
   - 使用 Raw URL 在 Home Assistant 中匯入藍圖
   - 建立自動化並測試功能

## 新增更多藍圖

未來如要新增更多藍圖，只需：

1. 在 `blueprints/automation/<your-username>/` 目錄下建立新的 YAML 檔案
2. 在 `README.md` 中加入說明
3. Commit 並 push 到 GitHub
4. 使用新的 Raw URL 匯入
