class Order < ApplicationRecord
  belongs_to :customer
  has_many :orderd_items, dependent: :destroy

<<<<<<< HEAD
  # orderのformでorderd_itemsのカラムを保存するために記述
  accepts_nested_attributes_for :orderd_items

=======
>>>>>>> develop
  enum payment_method:[:"クレジットカード", :"銀行振込"]
  enum address_method:[:"ご自身の住所", :"登録済みの住所から選択", :"新しいお届け先"]
  enum state: {"入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}

end