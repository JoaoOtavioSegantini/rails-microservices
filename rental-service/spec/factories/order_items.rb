FactoryBot.define do
  factory :order_item do
    product { nil }
    order { nil }
    qtd { "MyString" }
    total { "9.99" }
  end
end
