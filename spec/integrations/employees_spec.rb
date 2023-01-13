require 'rails_helper'

RSpec.describe "Employees", type: :request do
 context "integration testing for employee" do
  it "first a employee need to sign up(new,create),then go to show page,employee can see the all employee,after create he can update his information and he can delete his account" do
  get new_employee_path
  post employees_path, :params=>{ :employee => {:name=>"Tala",:email=>"example@gmail.com",:phone=>"76366288",:password=>"password",:password_confirmation=>"password",:date_of_birth=>"12/12/2012"}}
  employee = Employee.first
  get employee_path(employee)
  get employees_path
  get edit_employee_path(employee) 
  put employee_path(employee),:params=>{ :employee => {:name=>"Tala",:email=>"example!@gmail.com",:phone=>"76366288",:password=>"password",:password_confirmation=>"password",:date_of_birth=>"12/12/2012"}}
  delete employee_path(employee)
  end
 end
 
end
