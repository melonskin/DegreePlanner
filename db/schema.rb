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

ActiveRecord::Schema.define(version: 20170313033945) do

  create_table "courses", force: :cascade do |t|
    t.string   "department"
    t.integer  "number"
    t.string   "name"
    t.integer  "credit"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
    t.string   "is_fall"
    t.string   "is_spring"
    t.string   "is_summer"
  end

  create_table "coursesections", force: :cascade do |t|
    t.string   "department"
    t.integer  "number"
    t.integer  "section"
    t.string   "instructor"
    t.string   "term"
    t.integer  "year"
    t.float    "gpa"
    t.integer  "student"
    t.string   "a"
    t.string   "b"
    t.string   "c"
    t.string   "d"
    t.string   "f"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "q"
  end

  create_table "package_courseships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "course_id"
    t.integer  "package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "program_id"
    t.integer  "no_required"
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.boolean  "is_thesis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.string   "term"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_course_semesterships", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.integer  "semester_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "is_f1"
  end

end
