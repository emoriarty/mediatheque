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

ActiveRecord::Schema.define(:version => 20111109094940) do

  create_table "media", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "path"
    t.string   "file"
    t.string   "file_type"
    t.string   "cover"
    t.integer  "year"
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "director"
    t.integer  "duration"
    t.text     "cast"
    t.string   "writer"
    t.string   "composer"
    t.text     "plot"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "surname_1"
    t.string   "surname_2"
    t.string   "nick"
    t.string   "password"
    t.date     "birthday"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
