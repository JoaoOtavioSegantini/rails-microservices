FactoryBot.define do
  factory :order_item do
    product
    order
    qtd { "MyString" }
    total { "9.99" }
  end
end
