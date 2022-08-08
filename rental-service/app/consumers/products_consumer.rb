# frozen_string_literal: true

# Example consumer that prints messages payloads
class ProductsConsumer < ApplicationConsumer
  def consume
    messages.each { |message| puts message.payload }
    messages.each do |message|
      
    Product.find(:id => message.payload.id).first_or_create(
      :name => message.payload.name,
      :price => message.payload.price,
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
