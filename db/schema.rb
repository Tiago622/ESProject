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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_12_17_174147) do
=======
ActiveRecord::Schema.define(version: 2019_12_17_154830) do
>>>>>>> JoaoFerreira

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lessons", force: :cascade do |t|
    t.string "name"
<<<<<<< HEAD
    t.string "lesson_type"
    t.string "week_day"
=======
    t.string "teacher"
    t.string "school_year"
    t.string "lesson_type"
    t.string "weekday"
>>>>>>> JoaoFerreira
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spaces", force: :cascade do |t|
    t.string "name"
    t.string "room_type"
    t.integer "capacity"
    t.string "equipment"
    t.boolean "availability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
