class ChangeParentRecipeIdToBigint < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :parent_recipe_id, :bigint
  end
end
