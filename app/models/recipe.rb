class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :difficulty
  belongs_to :base_liquor
  belongs_to :flavor

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true,  reject_if: :quantity_blank?

  def quantity_blank?(attributes)
    attributes['quantity'].blank?
  end

  def self.ransackable_attributes(auth_object = nil)
    ["base_liquor_id", "difficulty_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["base_liquor", "difficulty", "flavor", "ingredients", "parent_recipe", "recipe_ingredients", "user"]
  end

  enum alcohol_strength: {weak:0 , medium:1 , strong:2 }
end
