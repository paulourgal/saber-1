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

ActiveRecord::Schema.define(version: 20170713160403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessements", force: :cascade do |t|
    t.integer  "quarter"
    t.date     "assessement_date"
    t.integer  "type"
    t.string   "label"
    t.integer  "grade"
    t.integer  "enrollment_id"
    t.integer  "course_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "assessements", ["course_id"], name: "index_assessements_on_course_id", using: :btree
  add_index "assessements", ["enrollment_id"], name: "index_assessements_on_enrollment_id", using: :btree

  create_table "attendances", force: :cascade do |t|
    t.date     "attendance_date"
    t.text     "obs"
    t.integer  "status"
    t.integer  "enrollment_id"
    t.integer  "course_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "attendances", ["course_id"], name: "index_attendances_on_course_id", using: :btree
  add_index "attendances", ["enrollment_id"], name: "index_attendances_on_enrollment_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "employees", ["cpf"], name: "index_employees_on_cpf", unique: true, using: :btree

  create_table "enrollments", force: :cascade do |t|
    t.integer  "school_class_id"
    t.integer  "student_id"
    t.date     "enrolled_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "enrollments", ["school_class_id"], name: "index_enrollments_on_school_class_id", using: :btree
  add_index "enrollments", ["student_id"], name: "index_enrollments_on_student_id", using: :btree

  create_table "school_classes", force: :cascade do |t|
    t.integer  "school_id"
    t.string   "name"
    t.integer  "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "school_classes", ["school_id"], name: "index_school_classes_on_school_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachings", force: :cascade do |t|
    t.integer  "school_class_id"
    t.integer  "employee_id"
    t.integer  "course_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "teachings", ["course_id"], name: "index_teachings_on_course_id", using: :btree
  add_index "teachings", ["employee_id"], name: "index_teachings_on_employee_id", using: :btree
  add_index "teachings", ["school_class_id"], name: "index_teachings_on_school_class_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.string   "cpf"
  end

  add_index "users", ["cpf"], name: "index_users_on_cpf", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "assessements", "courses"
  add_foreign_key "assessements", "enrollments"
  add_foreign_key "attendances", "courses"
  add_foreign_key "attendances", "enrollments"
  add_foreign_key "enrollments", "school_classes"
  add_foreign_key "enrollments", "students"
  add_foreign_key "school_classes", "schools"
  add_foreign_key "teachings", "courses"
  add_foreign_key "teachings", "employees"
  add_foreign_key "teachings", "school_classes"
end
