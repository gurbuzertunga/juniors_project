class EmployeesController < ApplicationController

    def new
        @employee = Employee.new
    end

    def show
        @current_user = current_user
        redirect_to '/signin' unless @current_user
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save!
            flash[:success] ="Welcome To Employee page"
            redirect_to root_path
        else
           flash[:danger]="Failed to sign up .Please try again"
           render 'new'
        end
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
            flash[:success]="Successfuly updated!!!"
            redirect_to @employee
        else
            flash[:danger]="Failed to update"
            redirect_to edit_employee_path(@employee.id)
        end
    end

    private 
    def employee_params 
        params.require(:employee).permit(:name,:email,:password,:phone,:date_of_birth)
    end
end
