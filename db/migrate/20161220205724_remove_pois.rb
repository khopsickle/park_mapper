class RemovePois < ActiveRecord::Migration[5.0]
  def change
    drop_table :pois
  end
end
