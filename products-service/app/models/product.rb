class Product < ApplicationRecord

    after_create :set_queue
    after_update :set_queue

    private

    def set_queue
        Karafka.producer.produce_async(
            topic: 'products',
            payload: self.to_json
          )
    end
end
