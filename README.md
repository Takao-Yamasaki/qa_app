# 構築手順
## 日本語翻訳ファイルのダウンロード
```
$ wget https://raw.githubusercontent.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml --output-file=config/locales/ja.yml
```
- `config/appllication.rb`に次のコードを追加
```
config.i18n.default_locale = :ja
```

## ユーザーモデルの作成
ユーザーモデルの雛形を作成する
```
$ rails g model User name:string email:string
```

