# Preview all emails at http://localhost:3000/rails/mailers/delivered_product
class DeliveredProductPreview < ActionMailer::Preview
     
     # http://localhost:3000/rails/mailers/delivered_product_mailer/delivered_order
     def delivered_order
        @customer = Customer.first
        @product = @customer.products.first
        DeliveredProductMailer.delivered_order(@customer,@product)
    end
end
