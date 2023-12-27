class TicketBooking < ApplicationRecord
	belongs_to :customer, :foreign_key => "customer_id"
	belongs_to :event, :foreign_key => "event_id"
	belongs_to :ticket
end
