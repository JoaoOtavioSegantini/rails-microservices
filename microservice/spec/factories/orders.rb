FactoryBot.define do
  factory :order do
    customer
    status { "MyString" }
    discount { "9.99" }
    total { "9.99" }
    order_date { "2022-08-06 14:32:59" }
  end
end
