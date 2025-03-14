# Medilab - 薬局管理システム学習アプリケーション

## 概要

Medilabは、Ruby on Railsのアプリケーションで、Pryなどのデバッグツールの使い方を実践的に学ぶために作成しました。

### 主な機能

- 患者情報の管理（登録・編集・検索）


## アプリケーションの入手方法

GitHubからクローンしてください。

https://github.com/funxxfun/medilab


## セットアップ手順

### 今回使用した環境

- Ruby 3.0.0
- Rails 8.0.2
- SQLite3 2.6.0
- Bundler 2.5.0

`bundle install`を実行してgemをインストールします。

### データベースをセットアップする

```bash
rails db:create
rails db:migrate
rails db:seed
```

※seedデータにより、サンプルの患者データ、薬剤データ、相互作用データが登録されます。

### アプリケーションを起動する

```bash
rails s
```

ブラウザで http://localhost:3000 にアクセスすると、トップページ（患者一覧）が表示されます。

## 基本的な使い方

### 患者管理

1. トップページ（患者一覧）から「新規患者登録」をクリックする
2. 患者情報（名前、年齢、病歴、保険番号）を入力する
3. 「登録」ボタンをクリックする
4. トップページに戻ると登録された患者を確認できます

※練習用アプリケーションのため、上記以外の機能は実装しておりません。


## 開発環境

このアプリケーションは以下の環境で開発しています

### ハードウェア
- MacBook Pro


### ソフトウェア
- OS: macOS Sequoia 15.3
- Ruby/Rails: Rails 8.0.2
- データベース: SQLite3 2.6.0
- Bundler: 2.5.15

### 主要なGem
- pry-rails
- pry-byebug
- pry-doc
