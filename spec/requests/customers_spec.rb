require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "employees" do

    it "new,create(sign up)" do 
      get new_customer_path
      post customers_path, :params=>{ :customer => {:name=>"Tala",:email=>"example@gmail.com",:password=>"password",:password_confirmation=>"password",:date_of_birth=>"12/12/2012"}}
    
    end
    it "index" do
     get customers_path
    end

    it "show" do 
      customer = Customer.new(name:"Tala",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      customer.save
      get customer_path(customer)
    end

    it "edit,update" do
      customer = Customer.new(name:"Tala",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      customer.save
      get edit_customer_path(customer) 
      put customer_path(customer),:params=>{ :customer => {:name=>"Tala",:email=>"example!@gmail.com",:password=>"password",:password_confirmation=>"password",:date_of_birth=>"12/12/2012"}}
    end

    it "destroy" do
      customer = Customer.new(name:"Tala",email:"example@gmail.com",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      customer.save
      delete customer_path(customer)
    end
  end
end
