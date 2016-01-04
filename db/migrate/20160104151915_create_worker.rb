class CreateWorker < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.belongs_to :user, null: false, index: true
      t.belongs_to :restaurant, null: false, index: true
      t.boolean :manager, null: false, default: false
      t.boolean :owner, null: false, default: false
      t.float :wage

      t.timestamps null: false
    end
  end
end
