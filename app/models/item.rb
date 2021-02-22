class Item < ApplicationRecord
  belongs_to :genre
  attachment :image
  has_many :orderd_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :title, presence: true
  validates :non_tax_price, presence: true
  validates :genre_id, presence: true

  # 商品の税込価格
  def tax_included
    (non_tax_price*1.08).round
  end

end
