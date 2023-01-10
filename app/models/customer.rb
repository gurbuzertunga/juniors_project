class MyValidator < ActiveModel::Validator
    def validate(record)
        emails = ["abounassif.roni@gmail.com","roni@gmail.com"]
        emails.each do |mail|
            if mail == record.email
                record.errors.add :email, "Emaily is already taken!"
            end
        end
      
    end
  end

class Customer < ApplicationRecord
    include ActiveModel::Validations
 validates_presence_of :email,:password,:name,:date_of_birth
 validates :email,uniqueness: true
 validates_with MyValidator
 


 

 
end
