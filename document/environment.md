# 開発環境構築

## 必要なもの

* git

* ruby

* bundler

## Windowsの場合

### Gitのインストール

以下からインストーラをダウンロードして、画面に従ってインストールしてください。

https://gitforwindows.org/

### Rubyのインストール

以下からインストーラをダウンロードして、画面に従ってインストールしてください。

https://rubyinstaller.org/

### Ruby DevKit をインストール


## Mac の場合

```
$ brew install rbenv
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
$ echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
$ source .bash_profile
$ rbenv --version 　　　　　 # => バージョン確認
$ rbenv install --list 　　 # => インストール可能なバージョン一覧の表示
$ rbenv install [バージョン] # => rubyのインストール
$ rbenv rehash             # => rbenv の再読み込み
$ rbenv global [バージョン]  # => defaultで使うrubyのバージョン
$ gem install bundler      # => bundlerのインストール
```
