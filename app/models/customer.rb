class MyValidator < ActiveModel::Validator
    def validate(record)
        emails = ["abounassif.roni@gmail.com","roni@gmail.com"]
        emails.each do |mail|
            if mail == record.email
                record.errors.add :email, "is already taken!"
            end
        end
      
    end
  end

class Customer < ApplicationRecord
    include ActiveModel::Validations
 validates_presence_of :email,:password,:name,:date_of_birth
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, length: { maximum: 255 },
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: true
validates :password ,length: {minimum: 6}
 validates_with MyValidator
#  has_secure_password


 

 
end
