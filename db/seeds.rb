# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin = User.where(email: "admin1@eventbooking.com").first
if admin.blank?
	User.create! :email=>'admin1@eventbooking.com', :password => 'Pass@123', :password_confirmation => 'Pass@123', :username => 'Admin', :is_organiger => true
	user_id = User.where(email: "admin1@eventbooking.com").first.id
	EventOrganiger.create! :name => 'Administrator', :user_id => user_id, :contact_person => 'Admin', :phone_no => '9876543210', :is_admin => true
end

cust = User.where(email: "cust1@xyz.com").first
if cust.blank?
	User.create! :email=>'cust1@eventbooking.com', :password => 'Pass@123', :password_confirmation => 'Pass@123', :username => 'cust1', :is_organiger => false
	user_id = User.where(email: "cust1@eventbooking.com").first.id
	Customer.create! :name => 'Customer One', :user_id => user_id, :address => 'India', :phone_no => '1122334455'
end

event = Event.where(name: "Musical Program", event_organiger_id: EventOrganiger.last.id, venue: "ABC Ground")
if event.blank?
	Event.create! :name=> 'Musical Program', :event_date=> (Time.now + 10.days), :venue=> 'ABC Ground', :event_organiger_id=> EventOrganiger.last.id
end

Ticket.create! :ticket_type=> 'General Admission', :event_id=> Event.first.id, :price=> 500.00, :tot_ticket=> 100
Ticket.create! :ticket_type=> 'Coded Discount', :event_id=> Event.first.id, :price=> 400.00, :tot_ticket=> 50
Ticket.create! :ticket_type=> 'VIP Pass', :event_id=> Event.first.id, :price=> 1000.00, :tot_ticket=> 20

