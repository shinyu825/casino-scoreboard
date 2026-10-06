# 卓帳 (TakuCho)

友人とオフラインでブラックジャックやバカラを遊ぶときに、ディーラーの結果を記録・集計するための iOS アプリです。
金銭を賭けるためのものではなく、ゲームの進行を記録するスコアボードとして使います。

## 機能

### ブラックジャック
- ディーラーの最終結果(17 〜 21・BlackJack・Burst)をワンタップで記録
- 結果の一覧表示と、各結果の出現回数・合計回数の集計
- 直前の記録の削除、全記録のリセット

### バカラ
- BANKER / PLAYER / DRAW の結果を記録
- 記録を罫線(大路)形式のグラフで表示
- 直前の記録の削除、全記録のリセット

記録は端末内(UserDefaults)に保存され、アプリを閉じても保持されます。

## 動作環境

- iOS 17.5 以上(横向き表示)
- Xcode 15 以上
- SwiftUI

## 構成

```
TakuCho/
├── TakuChoApp.swift       エントリーポイント
├── View/
│   ├── SelectView.swift   ゲーム選択画面
│   ├── ContentView.swift  ブラックジャック画面
│   ├── ResultView.swift   結果一覧
│   ├── ButtonsView.swift  結果入力ボタン
│   ├── CountsView.swift   集計表示
│   ├── BaccaratView.swift バカラ画面
│   ├── GraphView.swift    罫線グラフ
│   └── BaButtonsView.swift
├── ViewModel/
│   └── MainViewModel.swift
└── Layout/                共通ボタン
```

## 画像について

- アプリアイコン・バカラ画面の背景: 自作(スクリプトで生成)
- ブラックジャック画面の背景: AI(ChatGPT)で生成
