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

ActiveRecord::Schema.define(version: 2020_08_10_145127) do

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.boolean "completed", default: false
    t.boolean "assigned", default: false
    t.string "role"
    t.string "number_of_hours"
    t.string "date"
    t.string "time"
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "volunteer_id"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "password_digest"
    t.integer "volunteer_id"
    t.string "pronouns"
    t.string "email"
    t.boolean "training", default: false
    t.boolean "qtlgbt"
    t.boolean "bipoc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
