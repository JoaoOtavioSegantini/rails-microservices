class Customer < ApplicationRecord
    has_many :orders, dependent: :destroy

    after_create :set_queue
    after_update :set_queue

    private

    def set_queue
        Karafka.producer.produce_async(
            topic: 'customers',
            payload: self.to_json
          )
    end
end
