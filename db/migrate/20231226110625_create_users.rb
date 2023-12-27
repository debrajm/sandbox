class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :password_confirmation
      t.string :username
      t.boolean :is_organiger
      t.string :status, :default => "Active"

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
