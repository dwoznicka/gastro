class CreateTable < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.belongs_to :floorplan, null: false, index: true
      t.string :name, null: false
      t.integer :capacity
      t.integer :x_position, null: false, default: 0
      t.integer :y_position, null: false, default: 0
      t.integer :x_size, null: false, default: 1
      t.integer :y_size, null: false, default: 1

      t.timestamps null: false
    end
  end
end
