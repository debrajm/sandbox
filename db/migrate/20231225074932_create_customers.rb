class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :user_id
      t.string :address
      t.string :phone_no
      t.string :status, :default => "Active"

      t.timestamps
    end
  end
end
