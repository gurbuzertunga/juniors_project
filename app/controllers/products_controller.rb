class ProductsController < ApplicationController
    before_action :authenticate_user

    def index
        @products = Product.all
    end

    def create
        @product = current_user.products.new(product_params)
        if @product.save 
            flash[:notice]="Product successfuly created!!"
            redirect_to current_user
        else
           render "employees/show"
        end
    end

    def update
        product = Product.find(params[:id])
        if product.update(status: "Delivered")
            buy = Buy.find_by(product_id: product.id)
            customer = buy.customer
            SendMailJob.perform_now(customer,product)
            flash[:notice]="Product is delivered to customer"
            redirect_to buys_path
        else
            flash[:alert]="Failed to delivered ."
            redirect_to buys_path
        end
    end

    def mark_accepted
        product = Product.find(params[:product])
        product.update!(owner_id: params[:customer],owner_type:"Customer",status: "Accepted")
        flash[:notice]="Product is accepted from customer."
        redirect_to root_path
    end

    private 
    def product_params 
        params.require(:product).permit(:name,:price)
    end
end

