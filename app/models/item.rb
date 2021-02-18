class Item < ApplicationRecord
  #  belongs_to :genreを追加
  attachment :image
  has_many :orderd_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
  validates :title, presence: true
  validates :non_tax_price, presence: true
  
  # validates :genre_id, presence: true　を追加
  
end
