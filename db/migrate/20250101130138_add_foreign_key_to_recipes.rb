# frozen_string_literal: true

class AddForeignKeyToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :recipes, :recipes, column: :parent_recipe_id
  end
end
