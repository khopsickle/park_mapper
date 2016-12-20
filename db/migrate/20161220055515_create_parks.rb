class CreateParks < ActiveRecord::Migration[5.0]
  def change
    create_table :parks do |t|
      t.float :acreage
      t.string :location_type
      t.string :location_coordinates
      t.integer :parkid
      t.string :parkname
      t.string :parktype
      t.integer :supdist
      t.integer :zipcode
      t.float :evaluation
    end

    add_index :parks, :parkname
  end
end
