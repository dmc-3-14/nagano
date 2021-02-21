class Order < ApplicationRecord
  belongs_to :customer
  has_many :orderd_items, dependent: :destroy

  # orderのformでorderd_itemsのカラムを保存するために記述
  accepts_nested_attributes_for :orderd_items

  enum payment_method:[:"クレジットカード", :"銀行振込"]
  enum address_method:[:"ご自身の住所", :"登録済みの住所から選択", :"新しいお届け先"]

end