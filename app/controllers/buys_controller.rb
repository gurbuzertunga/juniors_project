class BuysController < ApplicationController
    before_action :authenticate_user

    def index
        @buys = Buy.all
    end

    def create
        buy = Buy.new(customer_id: params[:customer],product_id: params[:product])
        if buy.save 
            product = Product.find(params[:product])
            product.update!(status: "ordered")
            flash[:notice]="You successfuly ordered the product."
            redirect_to products_path
        else
            flash[:alert]="Failed to order the product."
            redirect_to products_path
        end

    end

end
