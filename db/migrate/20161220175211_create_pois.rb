class CreatePois < ActiveRecord::Migration[5.0]
  def change
    create_table :pois do |t|
      t.integer :zipcode, null: false
      t.integer :user_id, null: false

      t.index [:zipcode, :user_id], unique: true
      t.timestamps
    end
  end
end
