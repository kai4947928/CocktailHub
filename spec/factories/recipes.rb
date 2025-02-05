FactoryBot.define do
  factory :recipe do
    name { "testカクテル" }
    alcohol_strength { :medium }
    procedure { "手順の説明" }
    category { "original" }

    association :user
    association :difficulty
    association :base_liquor
    association :flavor
  end
end
