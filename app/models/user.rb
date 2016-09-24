class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :address

  has_many :carts
  
  accepts_nested_attributes_for :address, allow_destroy: true
end
