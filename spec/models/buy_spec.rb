require 'rails_helper'

RSpec.describe Buy, type: :model do
 context "validations" do

  it "product belongs_to" do 
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      employee.save
      product = Product.new(name:"product3",price: 22.5,owner_id: employee.id, owner_type: "Employee")
      product.save
      buy = Buy.new(product_id: product.id).save
      expect(buy).to eq(false)
  end

  it "customer belongs_to" do 
    customer = Customer.new(name:"Tala",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
    customer.save
    buy = Buy.new(customer_id: customer.id).save
    expect(buy).to eq(false)
  end

  
  it "should successfully save" do 
    employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
    employee.save
    product = Product.new(name:"test",price: 22.5,owner_id: employee.id, owner_type: "Employee")
    product.save
    customer = Customer.new(name:"Tala",email:"test@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
    customer.save
    buy = Buy.new(customer_id: customer.id,product_id: product.id).save
    expect(buy).to eq(true)
  end
  
 end
 
end
