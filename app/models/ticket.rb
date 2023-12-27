class Ticket < ApplicationRecord
	has_many :ticket_bookings
	belongs_to :event, :foreign_key => "event_id"

end
