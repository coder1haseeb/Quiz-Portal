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

ActiveRecord::Schema[7.0].define(version: 2024_02_09_111001) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "assignments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blanks", force: :cascade do |t|
    t.string "blank"
    t.string "correct_blank"
    t.integer "test_id"
    t.integer "marks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "falsities", force: :cascade do |t|
    t.string "statement"
    t.boolean "state"
    t.integer "marks"
    t.integer "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finals", force: :cascade do |t|
    t.integer "submit_id"
    t.integer "user_id"
    t.integer "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "option_key"
    t.string "option_text"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "entered_answer", limit: 1
    t.string "correct_option", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "test_id"
    t.integer "marks"
  end

  create_table "records", force: :cascade do |t|
    t.integer "total_answer"
    t.integer "test_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.boolean "status"
    t.integer "user_id"
    t.integer "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "retakes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "test_id"
    t.integer "obtained_marks"
    t.integer "total_marks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "savedanswers", force: :cascade do |t|
    t.integer "question_id"
    t.string "entered_answer"
    t.integer "user_id"
    t.integer "test_id"
    t.integer "option_id"
    t.integer "blank_id"
    t.string "entered_blank"
    t.integer "truefalse_id"
    t.boolean "entered_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submits", force: :cascade do |t|
    t.integer "question_id"
    t.string "entered_answer"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "test_id"
    t.integer "option_id"
    t.integer "blank_id"
    t.string "entered_blank"
    t.integer "truefalse_id"
    t.boolean "entered_state"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "retake_status"
  end

  create_table "tests_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "test_id", null: false
  end

  create_table "truefalses", force: :cascade do |t|
    t.string "statement"
    t.boolean "state"
    t.integer "test_id"
    t.integer "marks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "username"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
