class City < ApplicationRecord
  validates :name, presence: true

  has_many :towns, dependent: :destroy
end
