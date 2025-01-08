class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :difficulty
  belongs_to :base_liquor
  belongs_to :flavor
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :parent_recipe, class_name: 'Recipe', optional: true
  has_many :recipes, foreign_key: 'parent_recipe_id', dependent: :destroy

  validates :name, presence: true
  validates :category, inclusion: { in: ['original', 'arrange'] }

  def self.ransackable_attributes(auth_object = nil)
    ["base_liquor_id", "difficulty_id", "category"]
  end

  def self.ransackable_associations(auth_object = nil)
    # 検索可能にしたい関連付けをここに列挙
    # 例: "base_liquor", "difficulty", "flavor", "ingredients", "parent_recipe", "recipe_ingredients", "recipes", "user"
    ["base_liquor", "difficulty", "flavor", "ingredients", "parent_recipe", "recipe_ingredients", "user"]
  end

  enum alcohol_strength: { 弱め: 0, 普通: 1, 強め: 2 }
end
