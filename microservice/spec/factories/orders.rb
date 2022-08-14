FactoryBot.define do
  factory :order do
    customer
    status { ["pending", "finished", "cancelled"].sample }
    discount { rand(1..8) }
    total { Faker::Commerce.price }
    order_date { Time.now }
  end
end
