class Product < ApplicationRecord
  belongs_to :type
  belongs_to :color

  has_many :product_images, dependent: :destroy
  has_many :items, dependent: :destroy
end
