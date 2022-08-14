FactoryBot.define do
  factory :payment do
    amount { Faker::Commerce.price(range: 1.0..400.0) }
    order 
    payment_type { %i(credit debit bank_slip).sample.to_s }
    description { Faker::Lorem.sentence }
    payment_date { Time.zone.now }
  end
end
