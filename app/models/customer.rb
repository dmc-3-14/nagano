class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :post_code, presence: true
  validates :post_code, length: { is: 7 }
  validates :address, presence: true
  validates :telephone_number, presence: true

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :shippings, dependent: :destroy

  def active_for_authentication?
    super && (self.member_state == true)
  end

end
