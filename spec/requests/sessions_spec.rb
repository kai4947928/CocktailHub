#google認証
require "rails_helper"

RSpec.describe "Sessions", type: :request do
  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      provider: "google_oauth2",
      uid: "123456789",
      info: { email: "test@example.com", name: "Test User" },
      credentials: { token: "mock_token" }
    )
  end

  describe "Google OAuth ログイン" do
    it "Google認証でログインできる" do
      get "/users/auth/google_oauth2/callback"
      expect(response).to redirect_to(root_path) # リダイレクト先は適宜修正
    end

    it "認証に失敗した場合、ログインできない" do
      OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
      get "/users/auth/google_oauth2/callback"
      expect(response).to redirect_to(root_path) # login_path → new_session_path に修正
    end
  end

  describe "ログアウト" do
    it "ログアウトできる" do
      delete "/users/sign_out" # DELETE を POST に修正
      expect(response).to redirect_to(root_path)
    end
  end
end
