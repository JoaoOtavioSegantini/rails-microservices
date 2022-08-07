FactoryBot.define do
  factory :payment do
    amount { "9.99" }
    order { nil }
    payment_type { "MyString" }
    description { "MyString" }
    payment_date { "2022-08-07" }
  end
end
