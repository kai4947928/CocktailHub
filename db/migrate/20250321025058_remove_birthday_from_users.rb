class RemoveBirthdayFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :birthday, :date
  end
end
