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

ActiveRecord::Schema.define(version: 20170426230510) do

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

  create_table "interest_courseships", force: :cascade do |t|
    t.integer  "interest_id"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_courseships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "course_id"
    t.integer  "package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "program_id"
    t.integer  "no_required"
    t.string   "name"
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.boolean  "is_thesis"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "dep_hour"
    t.integer  "graded_grad_hour"
    t.integer  "ug_hour_min"
    t.integer  "ug_hour_max"
    t.integer  "non_dep_hour_min"
    t.integer  "non_dep_hour_max"
    t.integer  "seminar_hour_min"
    t.integer  "seminar_hour_max"
    t.integer  "direct_study_hour_min"
    t.integer  "direct_study_hour_max"
    t.integer  "total_hour"
    t.integer  "total_hour_prior"
    t.integer  "research_hour_min"
    t.integer  "research_hour_max"
    t.integer  "joint_hour_min"
    t.integer  "joint_hour_max"
    t.integer  "elective_hour_min"
    t.integer  "elective_hour_max"
    t.string   "joint_dep"
  end

  create_table "semesters", force: :cascade do |t|
    t.string   "term"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "special_courses", force: :cascade do |t|
    t.string   "department"
    t.integer  "number"
    t.string   "name"
    t.string   "description"
    t.string   "is_fall"
    t.string   "is_spring"
    t.string   "is_summer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "student_course_semesterships", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.integer  "semester_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "student_special_course_semesterships", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "special_course_id"
    t.integer  "semester_id"
    t.integer  "credit"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "program_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "is_f1"
    t.integer  "user_id"
    t.integer  "yearstart"
    t.integer  "yearend"
    t.string   "semstart"
    t.string   "semend"
    t.string   "has_prior_master"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
