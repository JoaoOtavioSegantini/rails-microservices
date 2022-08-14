FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Book.title }
    price { Faker::Commerce.price(range: 12..180) }
    qtd_avaliable { Faker::Number.number(digits: 2) }
    qtd_total { Faker::Number.number(digits: 2) }
  end
end
