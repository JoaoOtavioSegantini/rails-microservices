FactoryBot.define do
  factory :order do
    customer
    status { ["pending", "finished", "cancelled"].sample }
    discount { rand(1..8) }
    total { Faker::Commerce.price }
    order_date { Time.now }
    downpayment { "9.99" }
    delivery_fee { "9.99" }
    late_fee { "9.99" }
    balance { "9.99" }
    return_date { 2.weeks.from_now }
  end
end
