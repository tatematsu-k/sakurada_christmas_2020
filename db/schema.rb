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

ActiveRecord::Schema.define(version: 2020_12_15_095256) do

  create_table "group_postback_requestings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.string "action", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_group_postback_requestings_on_created_at"
    t.index ["group_id"], name: "index_group_postback_requestings_on_group_id"
    t.index ["user_id"], name: "index_group_postback_requestings_on_user_id"
  end

  create_table "group_shuffle_events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["created_at"], name: "index_group_shuffle_events_on_created_at"
    t.index ["group_id"], name: "index_group_shuffle_events_on_group_id", unique: true
    t.index ["user_id"], name: "index_group_shuffle_events_on_user_id"
  end

  create_table "group_start_christmas_events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["created_at"], name: "index_group_start_christmas_events_on_created_at"
    t.index ["group_id"], name: "index_group_start_christmas_events_on_group_id", unique: true
    t.index ["user_id"], name: "index_group_start_christmas_events_on_user_id"
  end

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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_groups_on_created_at"
    t.index ["group_uid"], name: "index_groups_on_group_uid", unique: true
  end

  create_table "shuffle_gift_publishing_deliverings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "shuffle_gift_publishing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "idx_shuffle_gift_publishing_delivering_2"
    t.index ["shuffle_gift_publishing_id"], name: "idx_shuffle_gift_publishing_delivering_1", unique: true
  end

  create_table "shuffle_gift_publishings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "shuffle_gift_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "target", null: false
    t.index ["created_at"], name: "index_shuffle_gift_publishings_on_created_at"
    t.index ["shuffle_gift_id"], name: "index_shuffle_gift_publishings_on_shuffle_gift_id", unique: true
  end

  create_table "shuffle_gifts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "user_gift_requesting_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_shuffle_gifts_on_created_at"
    t.index ["user_gift_requesting_id"], name: "index_shuffle_gifts_on_user_gift_requesting_id", unique: true
    t.index ["user_id"], name: "index_shuffle_gifts_on_user_id", unique: true
  end

  create_table "user_archives", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_user_archives_on_created_at"
    t.index ["user_id"], name: "index_user_archives_on_user_id"
  end

  create_table "user_follow_unfollows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_follow_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_user_follow_unfollows_on_created_at"
    t.index ["user_follow_id"], name: "index_user_follow_unfollows_on_user_follow_id", unique: true
  end

  create_table "user_follows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_user_follows_on_created_at"
    t.index ["user_id"], name: "index_user_follows_on_user_id", unique: true
  end

  create_table "user_gift_requesting_group_message_usings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_gift_requesting_id", null: false
    t.bigint "user_text_message_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_user_gift_requesting_group_message_usings_on_created_at"
    t.index ["user_gift_requesting_id"], name: "idx_user_gift_requesting_group_message_usings_1", unique: true
    t.index ["user_text_message_id"], name: "idx_user_gift_requesting_group_message_usings_2", unique: true
  end

  create_table "user_gift_requesting_private_message_usings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_gift_requesting_id", null: false
    t.bigint "user_text_message_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_user_gift_requesting_private_message_usings_on_created_at"
    t.index ["user_gift_requesting_id"], name: "idx_user_gift_requesting_group_message_usings_1", unique: true
    t.index ["user_text_message_id"], name: "idx_user_gift_requesting_group_message_usings_2", unique: true
  end

  create_table "user_gift_requestings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_user_gift_requestings_on_created_at"
    t.index ["user_id"], name: "index_user_gift_requestings_on_user_id", unique: true
  end

  create_table "user_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_user_infos_on_created_at"
    t.index ["user_id"], name: "index_user_infos_on_user_id", unique: true
  end

  create_table "user_santa_present_deliverings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_santa_present_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_santa_present_id"], name: "index_user_santa_present_deliverings_on_user_santa_present_id", unique: true
  end

  create_table "user_santa_presents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["url"], name: "index_user_santa_presents_on_url", unique: true
    t.index ["user_id"], name: "index_user_santa_presents_on_user_id", unique: true
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_users_on_created_at"
    t.index ["line_uid"], name: "index_users_on_line_uid", unique: true
  end

  add_foreign_key "group_postback_requestings", "groups"
  add_foreign_key "group_postback_requestings", "users"
  add_foreign_key "group_shuffle_events", "groups"
  add_foreign_key "group_shuffle_events", "users"
  add_foreign_key "group_start_christmas_events", "groups"
  add_foreign_key "group_start_christmas_events", "users"
  add_foreign_key "group_text_messages", "groups"
  add_foreign_key "group_text_messages", "users"
  add_foreign_key "shuffle_gift_publishing_deliverings", "shuffle_gift_publishings", name: "fk_shuffle_gift_publishing_delivering_1"
  add_foreign_key "shuffle_gift_publishings", "shuffle_gifts"
  add_foreign_key "shuffle_gifts", "user_gift_requestings"
  add_foreign_key "shuffle_gifts", "users"
  add_foreign_key "user_archives", "users"
  add_foreign_key "user_follow_unfollows", "user_follows"
  add_foreign_key "user_follows", "users"
  add_foreign_key "user_gift_requesting_group_message_usings", "user_gift_requestings", name: "fk_user_gift_requesting_group_message_usings_1"
  add_foreign_key "user_gift_requesting_group_message_usings", "user_text_messages", name: "fk_user_gift_requesting_group_message_usings_2"
  add_foreign_key "user_gift_requesting_private_message_usings", "user_gift_requestings", name: "fk_user_gift_requesting_private_message_usings_1"
  add_foreign_key "user_gift_requesting_private_message_usings", "user_text_messages", name: "fk_user_gift_requesting_private_message_usings_2"
  add_foreign_key "user_gift_requestings", "users"
  add_foreign_key "user_infos", "users"
  add_foreign_key "user_text_messages", "users"
end
