class CreateTicketBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :ticket_bookings do |t|
      t.integer :customer_id
      t.integer :ticket_id
      t.integer :event_id
      t.string :status, :default => "Active"
      
      t.timestamps
    end
  end
end
