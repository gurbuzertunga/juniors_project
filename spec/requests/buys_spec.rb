require 'rails_helper'

RSpec.describe "Buys", type: :request do
  describe "controller" do

    it "index" do
      get buys_path
    end

    it "create" do 
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      employee.save
      customer = Customer.new(name:"Tala",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      customer.save
      Current.user = employee
      product = Product.new(name:"product3",price: 22.5,owner_id: employee.id, owner_type: "Employee")
      product.save 
      Current.user = customer
      post buys_path, :params =>{:customer=> customer.id,:product=>product.id}
    end
    
  end
end
