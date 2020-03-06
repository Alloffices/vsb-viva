# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_05_221438) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.string "your_name"
    t.string "email"
    t.string "phone"
    t.string "date"
    t.string "time"
    t.string "notes"
    t.integer "contacted_via", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "center_docotrs", force: :cascade do |t|
    t.integer "doctor_id", null: false
    t.integer "center_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["center_id"], name: "index_center_docotrs_on_center_id"
    t.index ["doctor_id"], name: "index_center_docotrs_on_doctor_id"
  end

  create_table "center_doctors", force: :cascade do |t|
    t.integer "doctor_id", null: false
    t.integer "center_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["center_id"], name: "index_center_doctors_on_center_id"
    t.index ["doctor_id"], name: "index_center_doctors_on_doctor_id"
  end

  create_table "center_events", force: :cascade do |t|
    t.integer "center_id", null: false
    t.string "title"
    t.integer "approved", default: 0
    t.date "start_date"
    t.date "end_date"
    t.string "description"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["center_id"], name: "index_center_events_on_center_id"
  end

  create_table "center_services", force: :cascade do |t|
    t.integer "center_id", null: false
    t.integer "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["center_id"], name: "index_center_services_on_center_id"
    t.index ["service_id"], name: "index_center_services_on_service_id"
  end

  create_table "center_specialities", force: :cascade do |t|
    t.integer "center_id", null: false
    t.integer "speciality_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["center_id"], name: "index_center_specialities_on_center_id"
    t.index ["speciality_id"], name: "index_center_specialities_on_speciality_id"
  end

  create_table "centers", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.string "county"
    t.string "primary_phone"
    t.string "additional_phones"
    t.string "fax"
    t.integer "pharmacy"
    t.integer "humana"
    t.time "monday_hours"
    t.time "tuesday_hours"
    t.time "wednesday_hours"
    t.time "thursday_hours"
    t.time "friday_hours"
    t.time "saturday_hours"
    t.time "sunday_hours"
    t.time "special_hours"
    t.string "lat"
    t.string "lng"
    t.string "calendar_notes"
    t.string "approved_calendar_notes"
    t.integer "monday_ext_hours"
    t.integer "tuesday_ext_hours"
    t.integer "wednesday_ext_hours"
    t.integer "thursday_ext_hours"
    t.integer "friday_ext_hours"
    t.integer "saturday_ext_hours"
    t.integer "sunday_ext_hours"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_centers_on_user_id"
  end

  create_table "doctor_insurances", force: :cascade do |t|
    t.integer "doctor_id", null: false
    t.integer "insurance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_doctor_insurances_on_doctor_id"
    t.index ["insurance_id"], name: "index_doctor_insurances_on_insurance_id"
  end

  create_table "doctor_specialities", force: :cascade do |t|
    t.integer "doctor_id", null: false
    t.integer "speciality_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_doctor_specialities_on_doctor_id"
    t.index ["speciality_id"], name: "index_doctor_specialities_on_speciality_id"
  end

  create_table "doctor_types", force: :cascade do |t|
    t.integer "doctor_id", null: false
    t.integer "physician_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_doctor_types_on_doctor_id"
    t.index ["physician_type_id"], name: "index_doctor_types_on_physician_type_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.integer "language"
    t.string "education"
    t.string "certifications"
    t.string "biography"
    t.string "video_id"
    t.string "headshot_yext"
    t.string "headshot_source"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "glossaries", force: :cascade do |t|
    t.string "key_name"
    t.string "spanish"
    t.string "english"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "insurances", force: :cascade do |t|
    t.string "state"
    t.string "insurance_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "physician_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.string "canonical_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zip_codes", force: :cascade do |t|
    t.integer "zipcode"
    t.string "lat"
    t.string "lng"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "center_docotrs", "centers"
  add_foreign_key "center_docotrs", "doctors"
  add_foreign_key "center_doctors", "centers"
  add_foreign_key "center_doctors", "doctors"
  add_foreign_key "center_events", "centers"
  add_foreign_key "center_services", "centers"
  add_foreign_key "center_services", "services"
  add_foreign_key "center_specialities", "centers"
  add_foreign_key "center_specialities", "specialities"
  add_foreign_key "centers", "users"
  add_foreign_key "doctor_insurances", "doctors"
  add_foreign_key "doctor_insurances", "insurances"
  add_foreign_key "doctor_specialities", "doctors"
  add_foreign_key "doctor_specialities", "specialities"
  add_foreign_key "doctor_types", "doctors"
  add_foreign_key "doctor_types", "physician_types"
end
