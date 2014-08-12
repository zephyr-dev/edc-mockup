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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140812134524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string  "company_name"
    t.string  "company_url"
    t.string  "company_summary"
    t.string  "company_logo_url"
    t.string  "company_facebook"
    t.string  "company_twitter"
    t.string  "str_address_1"
    t.string  "str_address_2"
    t.string  "company_city"
    t.string  "company_state"
    t.string  "company_zip"
    t.string  "company_linkedIn"
    t.string  "primary_contact_email"
    t.string  "primary_contact_first_name"
    t.string  "primary_contact_last_name"
    t.string  "primary_contact_position"
    t.string  "primary_contact_phone"
    t.string  "tm1_email"
    t.string  "tm1_first_name"
    t.string  "tm1_last_name"
    t.string  "tm1_position"
    t.string  "tm2_email"
    t.string  "tm2_first_name"
    t.string  "tm2_last_name"
    t.string  "tm2_position"
    t.string  "tm3_email"
    t.string  "tm3_first_name"
    t.string  "tm3_last_name"
    t.string  "tm3_position"
    t.boolean "updated",                    default: false
    t.string  "table_row"
    t.string  "obfuscated_id"
  end

end
