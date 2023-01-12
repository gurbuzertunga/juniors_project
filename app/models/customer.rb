class CustomerValidator < ActiveModel::Validator
    def validate(record)
        
            if Employee.where(email:record.email).any?
                record.errors.add :email, "is already taken!"
            end 
    end
  end

class Customer < ApplicationRecord
    include ActiveModel::Validations

    has_many :products, as: :owner
    has_many :buys
    
 validates_presence_of :email,:password,:name,:date_of_birth
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, length: { maximum: 255 },
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: true
validates_uniqueness_of :name
validates :password ,length: {minimum: 6}
 validates_with CustomerValidator
has_secure_password


 

 
end
