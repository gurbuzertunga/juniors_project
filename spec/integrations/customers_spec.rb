require 'rails_helper'

RSpec.describe "Customers", type: :request do
 context "integration testing for customer" do
  it "first a customer need to sign up(new,create),then go to show page,customer can see the all customer,after create he can update his information and he can delete his account" do
    get new_customer_path
    post customers_path, :params=>{ :customer => {:name=>"Tala",:email=>"example@gmail.com",:password=>"password",:password_confirmation=>"password",:date_of_birth=>"12/12/2012"}}
    customer = Customer.first
    get customer_path(customer)
    get customers_path
    get edit_customer_path(customer) 
    put customer_path(customer),:params=>{ :customer => {:name=>"Tala",:email=>"example!@gmail.com",:password=>"password",:password_confirmation=>"password",:date_of_birth=>"12/12/2012"}}
    delete customer_path(customer)
  end
 end
 
end