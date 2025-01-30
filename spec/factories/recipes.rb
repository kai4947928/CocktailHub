FactoryBot.define do
  factory :recipe do
    name { "カクテルX" }
    association :user
    association :difficulty
    association :base_liquor
    association :flavor
  end
end
