class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :rememberable, :trackable, :validatable

  has_one :address
  accepts_nested_attributes_for :address, allow_destroy: true

  has_many :carts, dependent: :destroy

  enum role: [:buyer, :admin, :guest]
end
