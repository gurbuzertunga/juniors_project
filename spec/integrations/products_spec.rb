require 'rails_helper'

RSpec.describe "Products", type: :request do
 context "integration testing for products,then he can see his owned product" do
  it "first the employee must sign in then create a new product,the owned employee he can update the information of the product,after customer ordered the product the employee send to customer his order and after that customer will marked delivered" do
    employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
    employee.save
    Current.user = employee
    product = Product.new(name:"product3",price: 22.5,owner_id: employee.id, owner_type: "Employee")
    product.save 
    get edit_product_path(product)
    put product_path(product),:params =>{:product =>{:name=>"product",:price=>20}}
    get products_path
    post send_order_path(product)
    customer = Customer.new(name:"Tala",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
    customer.save
    Current.user = customer
    get mark_delivered_path,:params=>{:product=>product.id,:customer=>customer.id}
  end
 end
 
end