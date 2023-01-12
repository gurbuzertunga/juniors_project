class Review < ApplicationRecord
  validates :text, presence: true
  validates :creator, presence: true

  belongs_to :product
end
