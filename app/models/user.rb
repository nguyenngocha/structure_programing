class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :rememberable, :trackable, :validatable
  has_one :address

  has_many :carts
  
  enum role: [:user, :admin]
  accepts_nested_attributes_for :address, allow_destroy: true
end
