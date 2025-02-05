FactoryBot.define do
  factory :user do
    name { "Test User" }
    email { "user@example.com" }
    password { "password" }

    after(:build) do |user|
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        provider: 'google_oauth2',
        uid: '12345',
        info: {
          email: 'user@example.com',
          name: 'Test User'
        }
      })
      # UserがGoogle認証を通じて作成されるようにする
      user.assign_attributes(OmniAuth.config.mock_auth[:google_oauth2].slice(:uid, :provider, :info))
    end
  end
end
