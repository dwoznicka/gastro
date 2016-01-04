class CreateFloorplan < ActiveRecord::Migration
  def change
    create_table :floorplans do |t|
      t.belongs_to :restaurant, null: false, index: true
      t.integer :floor, null: false, default: 0
      t.string :name
      t.integer :size_x, null: false
      t.integer :size_y, null: false

      t.timestamps null: false
    end
  end
end
