class Product < ApplicationRecord
  belongs_to :type
  belongs_to :color

  has_many :product_images
  has_many :items
end
