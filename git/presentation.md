---
author: Eric Sagnes
title: Git勉強会
date: August, 18 2017
---

## Git

---

### Gitとは

- VCS (バージョン管理システム)
- Distributed (分散型)
- 2005年に初リリース

### コマンドライン

- `git`

### Git以外のVCS

- [Mercurial](https://www.mercurial-scm.org/)
- [Bazaar](http://bazaar.canonical.com/en/)
- [Pijul](https://pijul.org/)

### ベースオブジェクト

- レポジトリ
- コミット
- ブランチ
- リモート


## レポジトリ

---

### レポジトリとは

- Gitで管理されているファイルシステム領域
- **リモート**で分散されています

### コマンド

レポジトリの作成

```
$ git init
```

既存レポジトリをダウンロード

```
$ git clone URL
```

### ハンズオン

```
$ git clone https://github.com/ericsagnes/git.git
```

### Tips

``.gitignore``でgitの管理外ファイルを設定できる


## コミット

---

### コミットとは

- コードのスナップショット
- ハッシュで特定されている 例:`4ac2cd7d822f5db369d0cfcc5a2010874f57ca96`
- 親コミットを持っている
- ``git commit``でコミット作成


### コミットの移動

- コミットをリモートに送るは**プッシュ**と呼ぶ
- コミットをリモートから取得するは**プル**と呼ぶ


### Tips

最終コミットを修正

```
git commit --amend
```

コミット前に変更確認

```
$ git status
$ git diff
```

### ハンズオン

```
$ echo "hogehoge" > hogehoge.txt
$ git add hogehoge.txt
$ git commit
$ git commit --amend
```

## ブランチ

---

### ブランチとは

- 独立したコミット履歴（ローカルフォーク）
- ベースコミットを持つ


### コマンド

ブランチのリストアップ

```
$ git branch -vv
```

ブランチの作成

```
$ git checkout -b BRANCH_NAME
```

ブランチのマージする

```
$ git merge BRANCH_NAME
```

### Tips

マージ履歴を残す

```
$ git merge BRANCH_NAME --no-ff
```

### ハンズオン

```
$ git checkout -b test
$ echo "HOGEHOGE" > hogehoge.txt
$ git add hogehoge.txt
$ git commit
```

```
$ git checkout master
$ git merge test --no-ff
```

## リモート

---

### リモートとは

- レポジトリのブックマーク
- リモートからコミットをプッシュまたプルできます
- ``git remote -v``でリモートをリストできます

### コマンド

コミットをプッシュ

```
$ git push REMOTE_NAME
```

コミットをプル

```
$ git pull REMOTE_NAME
```

リモートの追加

```
$ git remote add NAME URL
```

### Tips

``.git/config``にリモートの情報があります


### ハンズオン

```
$ git remote -v
```


## リベース

---

### リベースとは

- もうひとつのマージ
- 履歴を書き直す
- ブランチの原点を変える

### コマンド

```
$ git rebase BRANCH_NAME
```

### Tips

対話リベース

```
$ git rebase -i BRANCH_NAME
```

### ハンズオン

```
$ git checkout messy
$ git rebase -i master
```

## 便利機能

---

### 便利機能

- ``git bisect``: エラーコミットを見つける
- ``submodules``: レポジトリの入れ子
- ``stash``: 変更の一時保存
- ``tag``: コミットにわかりやすい名前をあげる
- ``git log --pretty=oneline --graph --decorate --all``: グラフ表示
- ``cherry-pick``: 特定なコミットを他ブランチに当てる


## ワークフロー

---

### Git-flow

- [Git-flow](http://qiita.com/KosukeSone/items/514dd24828b485c69a05)


### Pull requests

- [サルでもわかるGit入門 - プルリクエスト](http://www.backlog.jp/git-guide/pull-request/pull-request1_1.html)


### コミットメッセージ

- [コミットメッセージ](http://postd.cc/how-to-write-a-git-commit-message/)


### CICD

- 継続インテグレーション・継続デリバリー
- CICD設定ファイルをGIT管理下に置く
    - Jenkins: マルチブランチパイプライン + ``Jenkinsfile``
    - Travis: `.travis.yml`
- [Twelve-factor App: コードベース](https://12factor.net/ja/codebase)


## ツール

---

### 便利なツール

- [tig](https://jonas.github.io/tig/)
- [blackbox](https://github.com/StackExchange/blackbox): 秘密管理


## フリートーク

