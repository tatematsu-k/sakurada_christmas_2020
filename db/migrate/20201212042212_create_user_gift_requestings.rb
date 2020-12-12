class CreateUserGiftRequestings < ActiveRecord::Migration[6.0]
  def change
    create_table :user_gift_requestings do |t|
      t.references :user, index: { unique: true }

      t.timestamps
    end
    add_index :user_gift_requestings, :created_at
    add_foreign_key :user_gift_requestings, :users
  end
end
