# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :provider
      t.date :birthday
      t.string :email

      t.timestamps
    end
  end
end
