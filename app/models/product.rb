class Product < ApplicationRecord
  belongs_to :product_type
  belongs_to :product_color

  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images,
    reject_if: proc {|attributes| attributes["_destroy"] == "1"}
end
