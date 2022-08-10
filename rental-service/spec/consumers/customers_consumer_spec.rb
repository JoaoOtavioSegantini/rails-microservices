# frozen_string_literal: true
require 'rails_helper'

RSpec.describe CustomersConsumer do
    subject(:consumer) { karafka.consumer_for(:customers) }
  
    let(:customers) do
      Array.new(2) do |number|
        {
          id: SecureRandom.uuid,
          name: "Customer #{number + 1}",
          email: "custommer_#{number + 1}@gmail.com",
          phone: "+55 19 #{rand(10000..99999)}-#{rand(1000..9999)}"
        }
      end
    end
  
    # Publish two clients
    before { customers.each { |customer| karafka.publish(customer.to_json) } }
  
    it 'expects to save the clients' do
      expect { consumer.consume }.to change(Customer, :count).by(2)
    end
  end