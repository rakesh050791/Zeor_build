# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140111053137) do

  create_table "privacies", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "terms", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "company_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "password"
    t.string   "phone"
    t.string   "gender"
    t.integer  "age"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "password_reset_created_at"
    t.string   "auth_token"
    t.string   "confirmation_token"
    t.datetime "confirmation_token_sent_at"
  end

end
