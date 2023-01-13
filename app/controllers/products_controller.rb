class ProductsController < ApplicationController
    before_action :authenticate_user

    def index
        @products = Product.where(status: nil)
    end
    def new 
        @product = Product.new
    end
    def create
        @product = current_user.products.new(product_params)
        @product.image.attach(params[:product][:image])
        if @product.save 
            flash[:notice]="Product successfuly created!!"
            redirect_to my_products_path
        else
           render "new"
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        @product.image.attach(params[:product][:image])
        if @product.update(product_params)
            flash[:notice]="Product is updated!!"
            redirect_to current_user
        else
            flash[:alert]="Failed to update."
            render 'edit'
        end
    end

    def send_order 
        @product = Product.find(params[:id])
        if @product.update(status: "sent")
            buy = Buy.find_by(product_id: @product.id)
            customer = buy.customer
            SendMailJob.perform_now(customer,@product)
            flash[:notice]="The order is sent"
            redirect_to buys_path
        else
            flash[:alert]="Failed to sent!!"
            redirect_to buys_path
        end
    end

    def mark_delivered
        product = Product.find(params[:product])
        product.update!(owner_id: params[:customer],owner_type:"Customer",status: "delivered")
        flash[:notice]="Product is now yours."
        redirect_to root_path
    end
    def myproducts
        @products = current_user.products
    end
    private 
    def product_params 
        params.require(:product).permit(:name,:price)
    end
end

