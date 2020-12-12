class CreateTextMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :user_text_messages do |t|
      t.references :user, null: false
      t.text :text, null: false

      t.timestamps
    end
    add_index :user_text_messages, :created_at
    add_foreign_key :user_text_messages, :users

    create_table :group_text_messages do |t|
      t.references :group, null: false
      t.references :user, null: false
      t.text :text, null: false

      t.timestamps
    end
    add_index :group_text_messages, :created_at
    add_foreign_key :group_text_messages, :groups
    add_foreign_key :group_text_messages, :users
  end
end
