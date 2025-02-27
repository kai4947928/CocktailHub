FactoryBot.define do
  factory :recipe do
    name { "モヒート" }
    alcohol_strength { :weak } # アルコール強度（弱）
    procedure { "Make a Mojito" } # 手順
    official { false } # 公式投稿かどうか
    category_list { ["original"] }

    # 必要な関連データ
    difficulty { create(:difficulty, name: "簡単") }
    base_liquor { create(:base_liquor, name: "ラム") }
    flavor { create(:flavor, name: "甘い") }
    user { create(:user, email: "test@example.com", provider: "google_oauth2", uid: "123456789") }
  end
end