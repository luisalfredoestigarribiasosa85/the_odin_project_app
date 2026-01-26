class CarImage < ApplicationRecord
  belongs_to :car
  has_one_attached :image
  validates :image, presence: true
end
