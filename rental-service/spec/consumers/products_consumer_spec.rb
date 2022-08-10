# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ProductsConsumer do
    subject(:consumer) { karafka.consumer_for(:products) }
  
    let(:products) do
      Array.new(2) do |number|
        {
          id: SecureRandom.uuid,
          name: "Product #{number + 1}",
          price: rand(10..250)
        }
      end
    end
  
    # Publish two products
    before { products.each { |product| karafka.publish(product.to_json) } }
  
    it 'expects to save the products' do
      expect { consumer.consume }.to change(Product, :count).by(2)
    end
  end