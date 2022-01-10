class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
