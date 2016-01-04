class CreateBooking < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.belongs_to :user, null: false, index: true
      t.belongs_to :table, null: false, index: true
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.boolean :confirmed, default: false
      t.string :description
      t.boolean :active, null: false, default: false

      t.timestamps null: false
    end
  end
end
