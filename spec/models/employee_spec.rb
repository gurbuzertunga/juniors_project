require 'rails_helper'

RSpec.describe Employee, type: :model do
  context "validations" do 
    it  "name validation" do 
      employee = Employee.new(email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012").save
      expect(employee).to eq(false)
    end

    it  "email validation" do 
      employee = Employee.new(name:"Tala",email:"example@gmail",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012").save
      expect(employee).to eq(false)
    end

    it  "password confirmation validation" do 
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"passwor",date_of_birth:"12/12/2012").save
      expect(employee).to eq(false)
    end

    it  "date  of birth validation" do 
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password").save
      expect(employee).to eq(false)
    end

    it  "phone validation" do 
      employee = Employee.new(name:"Tala",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012").save
      expect(employee).to eq(false)
    end

    it  "should successfuly saave" do 
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012").save
      expect(employee).to eq(true)
    end


  end
end
