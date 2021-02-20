class Shipping < ApplicationRecord
  belongs_to :customer
  validates :post_code, presence: true
  validates :post_code, length:{ is: 7 }
  validates :address, presence: true
  validates :name, presence: true
  def full_shipping
    self.post_code + self.address + self.name
  end
end
