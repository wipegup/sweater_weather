FactoryBot.define do
  factory :user do
    email { "example@mail.com" }
    password_digest { "password" }
    api_key { SecureRandom.hex }
  end
end
