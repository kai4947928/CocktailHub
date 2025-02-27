#ユーザ作成
require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.from_omniauth' do
    let(:auth) do
      OmniAuth::AuthHash.new(
        provider: 'google_oauth2',
        uid: '123456789',
        info: {
          email: 'test@example.com',
          name: 'Test User',
          image: 'https://example.com/test.jpg'
        }
      )
    end

    it 'Google認証で新規ユーザーを作成する' do
      user = User.from_omniauth(auth)
      expect(user).to be_persisted  # データベースに保存されているか
      expect(user.email).to eq('test@example.com')
      expect(user.name).to eq('Test User')
    end

    it '既存のユーザーがログインする場合、新規作成しない' do
      existing_user = User.create!(
        email: 'test@example.com',
        name: 'Existing User',
        provider: 'google_oauth2',
        uid: '123456789',
        password: SecureRandom.hex(10)
      )

      user = User.from_omniauth(auth)
      expect(user.id).to eq(existing_user.id)  # 既存ユーザーのIDと同じか
    end
  end
end
