class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :ticket_type
      t.integer :event_id
      t.decimal :price
      t.integer :tot_ticket
      t.string :status, :default => "Active"
      
      t.timestamps
    end
  end
end
