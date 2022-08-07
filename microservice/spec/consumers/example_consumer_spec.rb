# frozen_string_literal: true
require 'securerandom'
require 'karafka/testing/rspec/helpers'
require './karafka'

RSpec.describe "ExampleConsumer" do
    subject(:consumer) { karafka.consumer_for(:orders) }
  
    let(:visitor_id) { SecureRandom.uuid }
    let(:visits) do
      Array.new(2) do
        {
          id: SecureRandom.uuid,
          order_date: Time.now,
          customer_id: visitor_id,
          status: 'pending',
          discount: '20',
          total: 250
        }
      end
    end
  
    # Publish two visits of one user
    before { visits.each { |visit| karafka.publish(visit) } }
  
    it 'expects to save the orders' do
      expect { consumer.consume }.to change(Order, :count).by(2)
    end
  end