FactoryBot.define do
  factory :user do
    name { Faker::NameBR.name }
    email { FFaker::Internet.email }
    password_digest { SecureRandom.hex(8) }
    role { 1 }
    active { false }
  end
end
