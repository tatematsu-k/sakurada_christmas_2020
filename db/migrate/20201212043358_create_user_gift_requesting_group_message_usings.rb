class CreateUserGiftRequestingGroupMessageUsings < ActiveRecord::Migration[6.0]
  def change
    create_table :user_gift_requesting_group_message_usings do |t|
      t.references :user_gift_requesting,
                   index: {
                     unique: true,
                     name: :idx_user_gift_requesting_group_message_usings_1,
                    }
      t.references :user_text_message,
                   index: {
                     unique: true,
                     name: :idx_user_gift_requesting_group_message_usings_2,
                   }

      t.timestamps
    end
    add_index :user_gift_requesting_group_message_usings, :created_at
    add_foreign_key :user_gift_requesting_group_message_usings, :user_gift_requestings, name: :fk_user_gift_requesting_group_message_usings_1
    add_foreign_key :user_gift_requesting_group_message_usings, :user_text_messages, name: :fk_user_gift_requesting_group_message_usings_2
  end
end
