class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :user, index: true
      t.string :street_name, null: false
      t.string :building_number, null: false
      t.string :apartment_number
      t.string :county
      t.string :postcode, null: false
      t.string :city, null: false

      t.timestamps null: false
    end
    add_foreign_key :addresses, :users
  end
end
