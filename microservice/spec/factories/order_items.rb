FactoryBot.define do
  factory :order_item do
    product
    order
    qtd { rand(10..20).to_s }
    total { "9.99" }
  end
end
