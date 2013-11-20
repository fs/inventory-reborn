class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :unit_type
      t.integer :inv_id
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :location_id
      t.boolean :on_depot, default: false
      t.boolean :out_of_order, default: false
      t.text :out_of_order_note

      t.timestamps
    end

    add_index :units, :inv_id
    add_index :units, :location_id
    add_index :units, :user_id
  end
end
