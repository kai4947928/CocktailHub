class RemoveOfficialAndParentRecipeIdFromRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :official, :boolean
    remove_column :recipes, :parent_recipe_id, :bigint
  end
end
