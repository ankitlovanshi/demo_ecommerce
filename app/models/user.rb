class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one :cart

  validates :first_name, presence: true
  validates :Last_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
