# frozen_string_literal: true

class CreateDifficulties < ActiveRecord::Migration[7.0]
  def change
    create_table :difficulties do |t|
      t.string :name

      t.timestamps
    end
  end
end
