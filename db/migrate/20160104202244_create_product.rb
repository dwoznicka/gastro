class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :unit_cost, null: false
      t.string :unit, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
