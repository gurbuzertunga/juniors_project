require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "contoller" do

    it " new,create session after creating logout" do 
      get root_path
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      employee.save
      post signin_path,:params => { :session => { :email => employee.email,:password=>employee.password }} 
      get signout_path
    end
    
   end
end
