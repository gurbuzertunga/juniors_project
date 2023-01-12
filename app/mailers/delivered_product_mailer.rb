class DeliveredProductMailer < ApplicationMailer

    def delivered_order(customer,product)
        @customer = customer
        @product = product
        mail to: @customer.email , subject: "Delivered Order"
    end
end
