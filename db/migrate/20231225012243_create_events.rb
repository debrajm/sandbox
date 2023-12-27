class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :event_date
      t.string :venue
      t.integer :event_organiger_id
      t.string :status, :default => "Active"

      t.timestamps
    end
  end
end
