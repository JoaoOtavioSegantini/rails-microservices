# frozen_string_literal: true

# Example consumer that prints messages payloads
class CustomersConsumer < ApplicationConsumer
  def consume
    messages.each { |message| puts message.payload }
    messages.each do |message|

    Customer.where(:id => message.payload["id"]).update_or_create(
      :name => message.payload["name"],
      :email => message.payload["email"],
      :phone => message.payload["phone"]
    )
    end
  end

  # Run anything upon partition being revoked
  # def revoked
  # end

  # Define here any teardown things you want when Karafka server stops
  # def shutdown
  # end
end
