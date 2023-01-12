class EmployeesController < ApplicationController
    before_action :authenticate_user, only: [:show, :edit, :update, :destroy]

    def index
        @employees = Employee.all        
    end
    

    def new
        @employee = Employee.new
    end

    def show
        @current_user = current_user
        redirect_to '/signin' unless @current_user
        @product = Product.new
        @products = @current_user.products
    end

    def create
        @employee = Employee.new(employee_params)
        @employee.image.attach(params[:employee][:image])

        if @employee.save
            flash[:notice] ="Welcome To Employee page"
            redirect_to root_path
        else
           flash.now[:alert]="Failed to sign up .Please try again"
           render 'new'
        end
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.image.attach(params[:employee][:image])

        if @employee.update(employee_params)
            flash[:notice]="Successfuly updated!!!"
            redirect_to @employee
        else
            flash[:alert]="Failed to update"
            redirect_to edit_employee_path(@employee.id)
        end
    end

    def destroy
        @employee = Employee.find(params[:id])
        first_employee = Employee.first
        products = @employee.products
        products.each do |product|
            product.update!(owner_id: first_employee.id)
        end
        if @employee.destroy
            flash[:notice] = "Account deleted Successfully"
            redirect_to root_path
        end
    end

    private 
    def employee_params 
        params.require(:employee).permit(:name,:email,:password,:phone,:date_of_birth)
    end
end
