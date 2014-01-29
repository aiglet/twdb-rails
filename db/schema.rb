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

ActiveRecord::Schema.define(:version => 20140129203951) do

  create_table "books", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.date     "pub_date"
    t.string   "ISBN"
    t.text     "description"
    t.boolean  "general_audiences"
    t.boolean  "teen_up"
    t.boolean  "mature"
    t.boolean  "explicit"
    t.boolean  "graphic_violence"
    t.boolean  "violence"
    t.boolean  "major_character_death"
    t.boolean  "character_death"
    t.boolean  "sex"
    t.boolean  "rape"
    t.boolean  "abuse"
    t.boolean  "child_abuse"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "extension"
    t.boolean  "no_ISBN"
  end

  create_table "identities", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "secret"
    t.string   "email"
    t.text     "description"
    t.date     "birthday"
    t.boolean  "general_audiences"
    t.boolean  "teen_up"
    t.boolean  "mature"
    t.boolean  "explicit"
    t.boolean  "graphic_violence"
    t.boolean  "violence"
    t.boolean  "major_character_death"
    t.boolean  "character_death"
    t.boolean  "sex"
    t.boolean  "rape"
    t.boolean  "abuse"
    t.boolean  "child_abuse"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.boolean  "admin"
  end

end
