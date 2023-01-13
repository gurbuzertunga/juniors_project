require 'rails_helper'

RSpec.describe "Employees", type: :request do
  describe "employees" do

    it "new,create(sign up)" do 
      get new_employee_path
      post employees_path, :params=>{ :employee => {:name=>"Tala",:email=>"example@gmail.com",:phone=>"76366288",:password=>"password",:password_confirmation=>"password",:date_of_birth=>"12/12/2012"}}
    
    end
    it "index" do
     get employees_path
    end

    it "show" do 
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      employee.save
      get employee_path(employee)
    end

    it "edit,update" do
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      employee.save
      get edit_employee_path(employee) 
      put employee_path(employee),:params=>{ :employee => {:name=>"Tala",:email=>"example!@gmail.com",:phone=>"76366288",:password=>"password",:password_confirmation=>"password",:date_of_birth=>"12/12/2012"}}
    end

    it "destroy" do
      employee = Employee.new(name:"Tala",email:"example@gmail.com",phone:"76366288",password:"password",password_confirmation:"password",date_of_birth:"12/12/2012")
      employee.save
      delete employee_path(employee)
    end
  end
end
