class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one :cart
  has_many :orders

  validates :first_name, presence: true
  validates :Last_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_user_cart

  def create_user_cart
    @cart = Cart.create(user_id: id)
  end
end
