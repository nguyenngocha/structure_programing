class Address < ApplicationRecord
  belongs_to :city
  belongs_to :town
  belongs_to :village
  belongs_to :user
end
