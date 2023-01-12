class Product < ApplicationRecord

  belongs_to :owner, polymorphic: true
  has_many :buys, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :price ,presence: true

  validates :status, inclusion: { in: [ nil ,"sent"] } , if: -> {Employee.find_by(email: Current.user.email)}
  validates :status, inclusion: { in: ["ordered","delivered"] } , if: -> {Customer.find_by(email: Current.user.email)}

  has_one_attached :image, :dependent => :destroy

end
