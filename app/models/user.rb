class User < ApplicationRecord
  has_one :address

  has_many :carts
end
