class AddUserInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio_text, :text
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
