class SendMailJob < ApplicationJob
  queue_as :default

  def perform(customer,product)
    DeliveredProductMailer.delivered_order(customer,product).deliver_now
  end
end
