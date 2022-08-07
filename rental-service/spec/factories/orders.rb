FactoryBot.define do
  factory :order do
    customer { nil }
    status { "MyString" }
    discount { "9.99" }
    total { "9.99" }
    order_date { "2022-08-06 23:58:52" }
    downpayment { "9.99" }
    delivery_fee { "9.99" }
    late_fee { "9.99" }
    balance { "9.99" }
    return_date { "2022-08-06 23:58:52" }
  end
end
