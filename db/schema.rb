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

ActiveRecord::Schema[7.0].define(version: 2022_10_18_013608) do
  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "message_categories", force: :cascade do |t|
    t.integer "message_id"
    t.integer "category_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["category_id"], name: "index_message_categories_on_category_id"
    t.index ["message_id"], name: "index_message_categories_on_message_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "title"
    t.string "question"
    t.integer "patient_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["patient_id"], name: "index_messages_on_patient_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string "response"
    t.integer "physician_id"
    t.integer "message_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["message_id"], name: "index_responses_on_message_id"
    t.index ["physician_id"], name: "index_responses_on_physician_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "type"
    t.string "name"
    t.string "npi"
    t.string "specialty"
    t.integer "uid"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

end
