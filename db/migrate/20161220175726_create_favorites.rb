class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false
      t.integer :park_id, null: false

      t.index [:park_id, :user_id], unique: true
      t.timestamps
    end
  end
end
