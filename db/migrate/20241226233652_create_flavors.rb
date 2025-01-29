# frozen_string_literal: true

class CreateFlavors < ActiveRecord::Migration[7.0]
  def change
    create_table :flavors do |t|
      t.string :name

      t.timestamps
    end
  end
end
