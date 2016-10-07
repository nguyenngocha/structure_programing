class Address < ApplicationRecord
  belongs_to :city
  belongs_to :town
end
