class EmployeeValidator < ActiveModel::Validator
    def validate(record)
        if Customer.where(email:record.email).any?
            record.errors.add :email, "is already taken!"
        end
    end
end

class Employee < ApplicationRecord
    include ActiveModel::Validations

    has_many :products, as: :owner

    validates :name, presence: true
    validates :date_of_birth, presence: true

    has_secure_password
    validates :password, presence: true

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum:255}, format: { with: VALID_EMAIL_REGEX } , uniqueness: true

    VALID_PHONE_REGEX = /\A\(?(?:\d{2})?\)?[- ]?\d{3}[- ]?\d{3}\z/i
    validates :phone, presence: true , format: { with: VALID_PHONE_REGEX }
    validates_with EmployeeValidator

    has_one_attached :image, :dependent => :destroy

end
