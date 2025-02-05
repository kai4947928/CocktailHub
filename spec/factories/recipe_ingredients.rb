FactoryBot.define do
  factory :recipe_ingredient do
    quantity { "30" }

    association :recipe
    association :ingredient
  end
end