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

ActiveRecord::Schema.define(:version => 20120620031804) do

  create_table "assignments", :force => true do |t|
    t.integer  "person_id"
    t.integer  "client_id"
    t.integer  "order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "assignments", ["client_id"], :name => "index_assignments_on_client_id"
  add_index "assignments", ["person_id"], :name => "index_assignments_on_person_id"

  create_table "call_comments", :force => true do |t|
    t.integer  "call_id"
    t.integer  "author_id"
    t.text     "body"
    t.boolean  "internal",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "call_comments", ["author_id"], :name => "index_call_comments_on_author_id"
  add_index "call_comments", ["call_id"], :name => "index_call_comments_on_call_id"

  create_table "calls", :force => true do |t|
    t.text     "title"
    t.integer  "area_id"
    t.integer  "author_id"
    t.integer  "assignee_id"
    t.integer  "client_id"
    t.integer  "contact_id"
    t.integer  "status_id"
    t.integer  "priority_id"
    t.integer  "severity_id"
    t.datetime "date_entered"
    t.integer  "release_found_id"
    t.integer  "release_resolved_id"
    t.text     "resolution"
    t.text     "problem"
    t.integer  "system_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "calls", ["area_id"], :name => "index_calls_on_area_id"
  add_index "calls", ["assignee_id"], :name => "index_calls_on_assignee_id"
  add_index "calls", ["author_id"], :name => "index_calls_on_author_id"
  add_index "calls", ["client_id"], :name => "index_calls_on_client_id"
  add_index "calls", ["contact_id"], :name => "index_calls_on_contact_id"
  add_index "calls", ["priority_id"], :name => "index_calls_on_priority_id"
  add_index "calls", ["release_found_id"], :name => "index_calls_on_release_found_id"
  add_index "calls", ["release_resolved_id"], :name => "index_calls_on_release_resolved_id"
  add_index "calls", ["severity_id"], :name => "index_calls_on_severity_id"
  add_index "calls", ["status_id"], :name => "index_calls_on_status_id"
  add_index "calls", ["system_id"], :name => "index_calls_on_system_id"

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "enums", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "enum_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.integer  "client_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "people", ["client_id"], :name => "index_people_on_client_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_hash"
    t.integer  "person_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "users", ["person_id"], :name => "index_users_on_person_id"

end
