class Event < ApplicationRecord
	belongs_to :event_organiger, :foreign_key => "event_organiger_id"
	has_many :tickets, dependent: :destroy
	has_many :ticket_bookings, dependent: :destroy
end
