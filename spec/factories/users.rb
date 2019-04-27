# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    cpf { Faker::Number.number(11) }
    mobile_phone { Faker::Number.number(12) }
    birth_date { Faker::Date.birthday(18, 100) }
  end
end
