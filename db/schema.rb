# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_26_110625) do
  create_table "customers", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "address"
    t.string "phone_no"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_organigers", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "contact_person"
    t.string "phone_no"
    t.boolean "is_admin"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "event_date"
    t.string "venue"
    t.integer "event_organiger_id"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticket_bookings", charset: "utf8", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "ticket_id"
    t.integer "event_id"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", charset: "utf8", force: :cascade do |t|
    t.string "ticket_type"
    t.integer "event_id"
    t.decimal "price", precision: 10
    t.integer "tot_ticket"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "password_confirmation"
    t.string "username"
    t.boolean "is_organiger"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
