class AddCategoryToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :category, :string, null: false, default: 'original'
  end
end
