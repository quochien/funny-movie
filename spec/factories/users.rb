FactoryBot.define do
  factory :user do
    email { Faker::Internet.email(SecureRandom.hex(4)) }
    password { Faker::Internet.password(8) }
  end
end
