class Car < ApplicationRecord
    has_one_attached :featured_image
    has_many_attached :gallery_images
    has_rich_text :description
    validates :make, :model, :year, :featured_image, presence: true
    validates :year, numericality: { greater_than_or_equal_to: 1900, less_than_or_equal_to: Date.today.year }
    validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
end
