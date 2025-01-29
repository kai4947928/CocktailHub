# frozen_string_literal: true

class ChangeAlcoholStrengthToIntegerInRecipes < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      ALTER TABLE recipes
      ALTER COLUMN alcohol_strength TYPE integer USING alcohol_strength::integer;
    SQL

    change_column_default :recipes, :alcohol_strength, 0
    change_column_null :recipes, :alcohol_strength, false
  end
end
