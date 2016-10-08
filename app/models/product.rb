class Product < ApplicationRecord
  belongs_to :product_type
  belongs_to :product_color

  has_many :product_images, dependent: :destroy
end
