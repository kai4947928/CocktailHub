FactoryBot.define do
  factory :user do
    name { "Test User" }
    password { "password" }
    password_confirmation { "password" }
    provider { "google_oauth2" }
    uid { "1234567890" }
  end
end