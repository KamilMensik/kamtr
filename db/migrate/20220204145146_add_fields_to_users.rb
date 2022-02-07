class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :name, :string, null: false
    add_column :users, :description, :string, null: false, default: "Description of me!"
    add_column :users, :date_of_birth, :date, null: false
    add_index :users, :username, unique: true
  end
end
