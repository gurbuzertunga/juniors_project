class Product < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :buys

  validates :name, presence: true, uniqueness: true
  validates :price ,presence: true
  
end
