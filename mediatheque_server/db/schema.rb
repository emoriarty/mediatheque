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

ActiveRecord::Schema.define(:version => 20111206175657) do

  create_table "media", :force => true do |t|
    t.string   "title",              :null => false
    t.string   "path"
    t.string   "file"
    t.string   "file_type"
    t.string   "cover"
    t.integer  "year"
    t.integer  "user_id",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "director"
    t.integer  "duration"
    t.text     "cast"
    t.string   "writer"
    t.string   "composer"
    t.text     "plot"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "surname_1"
    t.string   "surname_2"
    t.string   "nick"
    t.string   "encrypted_password"
    t.string   "salt"
    t.date     "birthday"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
