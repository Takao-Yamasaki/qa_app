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
### ユーザーモデルの雛形を作成する
- マイグレーションファイルを作成する
```
$ rails g model User name:string email:string
```
- `db/migrate/xxxxxxxxxxx_create_users.rb`の内容を編集する
- DBにusersテーブルを作成する
```
$ rails db:migrate
```

## Questionモデルの作成
```
$ rails g model Question title:string description:text
```
- そのまま`rails db:migrate`

## questionコントローラの作成
```
$ rails g controller questions index new create show edit destroy
```

## routes.rbへルーティングを定義
- `config/routes.rb`にルーティングを定義
```
root to: 'questions#index'
resources :questions
```

# ビューを作成
- `app/veiws/questions/index.html.slim`にリンクを追加
```
= link_to '質問作成', new_question_path, class: 'btn btn-primary'

```
- `config/locales/ja.yml`に追記し、翻訳情報を追記する
```
ja:
  activerecord:
    errors:
      messages:
        record_invalid: 'バリデーションに失敗しました: %{errors}'
        restrict_dependent_destroy:
          has_one: "%{record}が存在しているので削除できません"
          has_many: "%{record}が存在しているので削除できません"
    models:
      question: 質問
    attributes:
      question:
        id: ID
        title: タイトル
        description: 質問内容
```
- 質問作成画面のためのアクションを追加
`app/controllers/questions_controller.rb`に追記
```
def new
    @question = Question.new
end
```
- 登録アクションを実装する
```
def create
    @question = Question.new(questions_params)
    @question.save!
    redirect_to questions_url, notice: "質問を作成しました。"
end
```

- app/veiwx/layouts/application.html.slimの実装

## Userモデルにadminフラグを追加
- マイグレーションファイルの作成(flagの追加)
```
$ rails g migration add_admin_to_users
```
- マイグレーションファイルに記述を追加
```
def change
  add_colmun :users, :admin, :boolean, default: :false, null: false 
end
```
- カラムの追加
```
rails db:migrate
```