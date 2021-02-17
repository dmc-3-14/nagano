class Order < ApplicationRecord
  belongs_to :customer
  has_many :orderd_items, dependent: :destroy
end
