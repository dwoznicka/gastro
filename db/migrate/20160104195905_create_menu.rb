class CreateMenu < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.belongs_to :restaurant, index: true
      t.string :name
      t.boolean :published, null: false, default: false
      t.string :description

      t.timestamps null: false
    end
    add_foreign_key :menus, :restaurants
  end
end
