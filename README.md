# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version > Ruby3.0.0

* System dependencies 

* Configuration > using below gem files
* gem "mysql2"
* gem "bcrypt", "~> 3.1.7"
* gem "jwt"
* 

* Database creation > Pull code from https://github.com/debrajm/sandbox/master
Then run bellow command
* rake db:create
* rake db:migrate
* rake db:seed

For running project go to terminal
CREATE:
1) curl -X POST -H "Content-Type:application/json" -d '{ "customer_id": 1, "ticket_id": 2, "event_id": 1, "event_date": "2024-01-04", "status": "Active" }' http://localhost:3000/ticket_bookings 
2) curl -X POST http://localhost:3000/events -d '{ "event": { "name": "Dance Event", "event_date": "2024-01-21", "venue": "PQR Ground", "event_organiger_id":1 } }' -H "Content-Type: application/json"

SHOW:
1) curl http://localhost:3000/events

UPDATE:
1) curl -X PUT -H "Content-Type: application/json" -d '{"customer": {"phone_no": "1010101010”}}’ http://localhost:3000/customers/1

DELETE:
1) curl -X DELETE http://localhost:3000/customers/1 

