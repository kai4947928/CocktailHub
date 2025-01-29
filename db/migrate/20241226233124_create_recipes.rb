# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :alcohol_strength
      t.text :procedure
      t.boolean :official
      t.integer :parent_recipe_id
      t.integer :difficulty_id
      t.integer :base_liquor_id
      t.integer :user_id

      t.timestamps
    end
  end
end
