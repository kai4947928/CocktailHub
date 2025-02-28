FactoryBot.define do
  factory :recipe do
    name { "モヒート" }
    alcohol_strength { :weak }
    procedure { "Make a Mojito" }
    official { false }
    category_list { ["original"] }

    difficulty { create(:difficulty, name: "簡単") }
    base_liquor { create(:base_liquor, name: "ラム") }
    flavor { create(:flavor, name: "甘い") }
    user { create(:user, email: "test@example.com", provider: "google_oauth2", uid: "123456789") }
  end
end