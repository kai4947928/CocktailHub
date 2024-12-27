class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :difficulty
  belongs_to :base_liquor
  belongs_to :flavor
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :parent_recipe, class_name: 'Recipe', optional: true
  has_many :child_recipes, class_name: 'Recipe', foreign_key: 'parent_recipe_id'

  enum alcohol_strength: { weak: 0, medium: 1, strong: 2 }
end
