FactoryBot.define do
  factory :address do
    zip { Faker::Address.zip }
    street { Faker::Address.street_name }
    state { Faker::Address.state }
    city { Faker::Address.city }
  end
end
