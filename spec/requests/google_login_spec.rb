RSpec.describe 'Googleログイン', type: :request do
  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '12345',
      info: {
        email: 'user@example.com',
        name: 'Test User'
      }
    })
  end

  it 'Googleで認証してユーザーを作成する' do
    # Google認証用のコールバックURLにリクエストを送る
    get '/auth/google_oauth2/callback'

    # ユーザーが作成されたかどうかを確認
    user = User.find_by(email: 'user@example.com')
    expect(user).to be_present
    expect(user.uid).to eq('12345')
    expect(user.name).to eq('Test User')

    # ログイン後、トップページにリダイレクトされるか確認
    expect(response).to redirect_to(root_path)
  end
end
