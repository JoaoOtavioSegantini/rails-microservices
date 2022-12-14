# frozen_string_literal: true

# Example consumer that prints messages payloads
class ExampleConsumer < ApplicationConsumer
  def consume
    messages.each { |message| puts message.payload }

    messages.each do |message|
 
      Order.where(:id => message.payload["order"]["id"]).update_or_create!(
        :customer_id => message.payload["order"]["customer_id"],
        :status => message.payload["order"]["status"],
        :discount => message.payload["order"]["discount"],
        :total => message.payload["order"]["total"],
        :order_date => message.payload["order"]["order_date"],
    )

    message.payload["order"]["items"].each do |item|

      Product.where(:id => item["product"]["id"]).update_or_create!(
        :name => item["product"]["name"], 
        :price => item["product"]["price"], 
        :description => item["product"]["description"]
       )

      OrderItem.where(:id => item["id"]).update_or_create!(
              :order_id => item["order_id"],
              :product_id => item["product"]["id"],
              :qtd => item["qtd"],
              :total => item["total"]
      )
      end
    end 
  end

  # Run anything upon partition being revoked
  # def revoked
  # end

  # Define here any teardown things you want when Karafka server stops
  # def shutdown
  # end
end
