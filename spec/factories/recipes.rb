FactoryBot.define do
  factory :recipe do
    name { "モヒート" }
    alcohol_strength { :weak }
    procedure { "ミントとライムを潰してラムと混ぜる" }
    association :user
    association :difficulty
    association :base_liquor
    association :flavor

    trait :with_category do
      transient do
        category_list { [] }
      end

      after(:create) do |recipe, evaluator|
        recipe.category_list.add(evaluator.category_list) if evaluator.category_list
        recipe.save
      end
    end
  end
end