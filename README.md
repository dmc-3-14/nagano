# 行ったこと　YUKI

##  layouts/直下に２つのhtml作成
* _header.html.erb
* _errors.html.erb"

## ヘッダーのリンク先について
* 作成していないリンク先であれば、カスタマーはカスタマーtopへ　管理者は、管理者topへ遷移するように設定

## devise
* カスタマーテーブルにカラムを追加
* last_name, first_name, ana_last_name, kana_first_name, kana_first_name, post_code, address, telephone_number
* validates 設定

## その他
* サーバーを起動したら、カスタマーページが表示される
* 管理者ログイン、管理者新規登録は管理者トップページから行う。そのため、ヘッダーに管理者トップページへのリンクを設置
* customerのログイン画面、新規登録画面を修正、追記
* adminのログイン画面、新規登録画面を修正、追記
* ログイン、ログアウト、サインアップ時にフラッシュメッセージを表示
* application.scssにcssを追記(フラッシュメッセージを緑色にするため)
