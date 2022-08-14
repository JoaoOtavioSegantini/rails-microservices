# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ExampleConsumer do
    subject(:consumer) { karafka.consumer_for(:orders) }
  
    let(:customer) { create(:customer) }
    let(:order) { create_list(:order, 2) }

    let(:orders) do
      Array.new(2) do |number|
        {
          order: {
          id: (number + 1).to_s,
          order_date: Time.now,
          customer_id: customer.id,
          status: ["pending", "finished", "cancelled"].sample,
          discount: '20',
          total: 250,
          items: [
            product: { 
              id: SecureRandom.uuid, 
              name: Faker::Commerce.product_name, 
              price: Faker::Commerce.price, 
              description: Faker::Book.title 
              }, 
              order_id: order[number].id, 
              id: SecureRandom.uuid, 
              qtd: "10", 
              total: "50"
            ]
          }
        }
      end
    end

    # Publish two orders of one user
    before { orders.each { |order| karafka.publish(order.to_json) } }
  
    it 'expects to save the orders' do
      expect { consumer.consume }.to change(Order, :count).by(2)
    end

    it 'expects to save the products' do
      expect { consumer.consume }.to change(Product, :count).by(2)
    end

    it 'expects to save the items' do
      expect { consumer.consume }.to change(OrderItem, :count).by(2)
    end
  end