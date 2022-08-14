FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    address { Faker::Address.street_address }
    city {Faker::Address.city }
    state { Faker::Address.state }
    zipcode { Faker::Address.zip_code }
  end
end
