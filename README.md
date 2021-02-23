##修正箇所
* 1 管理者ログアウト後の遷移先を管理者ログイン画面に設定
* 2 customer/shipping/index.htmlに、表示しているカスタマーのオーダー情報の中の住所の表示(表示だけ編集、削除はわけわかめ)
* 3 shipping新規登録時のサクセスメッセージ変更
* 4 注文入力画面にて、新しいお届け先を選択し、バリデーションエラーにひっかかると、注文確定ボタンを押しても1つ前のページ(order/put.html) に戻る
* 5 ↑上記エラー発生した際、赤いフラッシュメッセージを追加

## 主にいじったファイル
* １　admins/session_controller
* ２　customer/shippings_controller
* ３　customer/shipping/index.html
* ４  order.rb
* ５   customer/orders_controller
* ６　application.html
* ７　application.sccs