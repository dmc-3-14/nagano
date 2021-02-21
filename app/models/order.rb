class Order < ApplicationRecord
  belongs_to :customer
  has_many :orderd_items, dependent: :destroy
  
  enum payment_method:[:"クレジットカード", :"銀行振込"]
  enum address_method:[:"ご自身の住所", :"登録済みの住所から選択", :"新しいお届け先"]

end