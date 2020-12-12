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

ActiveRecord::Schema.define(version: 2020_12_12_023224) do

  create_table "group_text_messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.text "text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_group_text_messages_on_created_at"
    t.index ["group_id"], name: "index_group_text_messages_on_group_id"
    t.index ["user_id"], name: "index_group_text_messages_on_user_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "group_uid", null: false
    t.index ["group_uid"], name: "index_groups_on_group_uid", unique: true
  end

  create_table "user_text_messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_user_text_messages_on_created_at"
    t.index ["user_id"], name: "index_user_text_messages_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "line_uid", null: false
    t.index ["line_uid"], name: "index_users_on_line_uid"
  end

  add_foreign_key "group_text_messages", "groups"
  add_foreign_key "group_text_messages", "users"
  add_foreign_key "user_text_messages", "users"
end
