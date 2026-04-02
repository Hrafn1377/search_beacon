# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_04_01_211237) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "employer_profiles", force: :cascade do |t|
    t.string "company_name", null: false
    t.datetime "created_at", null: false
    t.string "domain"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "verification_score", default: 0
    t.boolean "verified", default: false
    t.string "website"
    t.index ["user_id"], name: "index_employer_profiles_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "company", null: false
    t.datetime "created_at", null: false
    t.text "description", null: false
    t.string "experience_level", null: false
    t.datetime "expires_at"
    t.datetime "filled_at"
    t.integer "fraud_score", default: 0
    t.boolean "hired", default: false
    t.string "language", default: "en"
    t.string "location"
    t.boolean "remote", default: false
    t.integer "salary_max"
    t.integer "salary_min"
    t.string "status", default: "pending"
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.datetime "verified_at"
    t.string "work_authorization", default: "any"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "seeker_profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "experience_level"
    t.boolean "open_to_remote", default: false
    t.string "preferred_role"
    t.string "resume_url"
    t.integer "salary_max"
    t.integer "salary_min"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "work_authorization", default: "any"
    t.index ["user_id"], name: "index_seeker_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "role", default: "seeker", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "employer_profiles", "users"
  add_foreign_key "jobs", "users"
  add_foreign_key "seeker_profiles", "users"
end
