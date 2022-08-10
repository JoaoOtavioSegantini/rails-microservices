# frozen_string_literal: true

# Example consumer that prints messages payloads
class ExampleConsumer < ApplicationConsumer
  def consume
    messages.each { |message| puts message.payload }

    messages.each do |message|
      @order = Order.find(message.payload["order"]["id"])
      if (@order) 
          @order.destroy!
      end

      Order.create({
        :id => message.payload["order"]["id"],
        :customer_id => message.payload["order"]["customer_id"],
        :status => message.payload["order"]["status"],
        :discount => message.payload["order"]["discount"],
        :total => message.payload["order"]["total"],
        :order_date => message.payload["order"]["order_date"],
    })

    message.payload["order"]["items"].each do |item|

      Product.where(:id => item["product"]["id"]).first_or_create(:name => item["product"]["name"])

      OrderItem.where(:id => item["id"]).first_or_create({
              :order_id => item["order_id"],
              :product_id => item["product"]["id"],
              :qtd => item["qtd"],
              :total => item["total"]
      })
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
