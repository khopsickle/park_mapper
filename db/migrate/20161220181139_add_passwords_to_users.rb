class AddPasswordsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_digest, :string, null: false
    add_column :users, :auth_token, :string
    add_index :users, :auth_token, unique: true
  end
end
