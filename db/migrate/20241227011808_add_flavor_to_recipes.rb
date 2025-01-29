# frozen_string_literal: true

class AddFlavorToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :flavor_id, :integer
  end
end
