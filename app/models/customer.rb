class Customer < ApplicationRecord
	has_many :ticket_bookings, dependent: :destroy
end
