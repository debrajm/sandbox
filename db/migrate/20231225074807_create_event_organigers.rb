class CreateEventOrganigers < ActiveRecord::Migration[7.0]
  def change
    create_table :event_organigers do |t|
      t.string :name
      t.integer :user_id
      t.string :contact_person
      t.string :phone_no
      t.boolean :is_admin
      t.string :status, :default => "Active"
      
      t.timestamps
    end
  end
end
