require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "controllers" do

    it "index" do
      get products_path
    end

    it "create" do
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      employee.save
      post signin_path,:params => { :session => { :email => employee.email,:password=>employee.password }} 
      post products_path,:params =>{:product =>{:name=>"product",:price=>20}}
    end

    it "edit,update" do
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      employee.save
      Current.user = employee
      product = Product.new(name:"product3",price: 22.5,owner_id: employee.id, owner_type: "Employee")
      product.save 
      get edit_product_path(product)
      put product_path(product),:params =>{:product =>{:name=>"product",:price=>20}}
    end

    it "send order" do
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      employee.save
      Current.user = employee
      product = Product.new(name:"product3",price: 22.5,owner_id: employee.id, owner_type: "Employee")
      product.save 
      post send_order_path(product)
    end

    it "mark_delivered" do 
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      employee.save
      Current.user = employee
      product = Product.new(name:"product3",price: 22.5,owner_id: employee.id, owner_type: "Employee")
      product.save 
      customer = Customer.new(name:"Tala",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      customer.save
      Current.user = customer
      get mark_delivered_path,:params=>{:product=>product.id,:customer=>customer.id}
    end
    
  end
end
