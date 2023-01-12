require 'rails_helper'

RSpec.describe Product, type: :model do
   context "validation" do

    it " name validation " do
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      employee.save
      product = Product.new(price: 22.5,owner_id: employee.id, owner_type: "Employee").save 
      expect(product).to eq(false)
    end

    it " price validation " do
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      employee.save
      product = Product.new(name:"product3",owner_id: employee.id, owner_type: "Employee").save 
      expect(product).to eq(false)
    end

    it " should successfuly save " do
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      employee.save
      product = Product.new(name:"product3",price: 22.5,owner_id: employee.id, owner_type: "Employee").save 
      expect(product).to eq(true)
    end


    
   end
   
  
end
