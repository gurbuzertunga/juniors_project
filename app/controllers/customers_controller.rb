class CustomersController < ApplicationController

    def index
        @customers = Customer.all
    end
    def show
        @customer = Customer.find(params[:id])
    end
    def new
        @customer = Customer.new
    end
    def create 
        @customer = Customer.new(customer_params)
        if @customer.save
            flash[:notice] = "#{@customer.name} singed up successfully"
            redirect_to @customer
        else
            render 'new'
        end
    end
    def edit
        @customer = Customer.find(params[:id])
    end
    def update
        @customer = Customer.update(customer_params)
        if @customer.save
            flash[:notice] = "Profile updated Successfully"
            redirect to @customer
        else
            render 'edit'
        end
    end
    def destroy
        @customer = Customer.find(params[:id])
        if @customer.destroy
            flash[:notice] = "Account deleted Successfully"
            redirect_to customers_path
        end
    end
private
    def customer_params
        params.require(:customer).permit(:email,:password,:name,:date_of_birth)
    end

end
