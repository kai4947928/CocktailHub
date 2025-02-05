require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "レシピが正しく作成できること" do
    user = create(:user)
    recipe = create(:recipe, user: user)

    puts recipe.valid?
    puts recipe.errors.full_messages
    puts recipe.inspect

    expect(recipe).to be_valid
  end

  it "レシピに材料が追加できること" do
    recipe = create(:recipe)
    ingredient = create(:ingredient)
    recipe_ingredient = create(:recipe_ingredient, recipe: recipe, ingredient: ingredient)

    expect(recipe.ingredients).to include(ingredient)
  end
end
