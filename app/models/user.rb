class User < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :first_name, presence: true
  validates :Last_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
