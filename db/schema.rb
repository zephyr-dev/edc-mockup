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

ActiveRecord::Schema.define(version: 20140812180031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.text    "company_name"
    t.text    "company_url"
    t.text    "company_summary"
    t.text    "company_logo_url"
    t.text    "company_facebook"
    t.text    "company_twitter"
    t.text    "str_address_1"
    t.text    "str_address_2"
    t.text    "company_city"
    t.text    "company_state"
    t.text    "company_zip"
    t.text    "company_linkedIn"
    t.text    "primary_contact_email"
    t.text    "primary_contact_first_name"
    t.text    "primary_contact_last_name"
    t.text    "primary_contact_position"
    t.text    "primary_contact_phone"
    t.text    "tm1_email"
    t.text    "tm1_first_name"
    t.text    "tm1_last_name"
    t.text    "tm1_position"
    t.text    "tm2_email"
    t.text    "tm2_first_name"
    t.text    "tm2_last_name"
    t.text    "tm2_position"
    t.text    "tm3_email"
    t.text    "tm3_first_name"
    t.text    "tm3_last_name"
    t.text    "tm3_position"
    t.boolean "updated",                    default: false
    t.string  "table_row"
    t.string  "obfuscated_id"
  end

end
