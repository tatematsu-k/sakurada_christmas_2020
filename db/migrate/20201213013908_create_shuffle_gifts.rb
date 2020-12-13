class CreateShuffleGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shuffle_gifts do |t|
      t.references :user, null: false, index: { unique: true }
      t.references :user_gift_requesting, null: false, index: { unique: true }

      t.timestamps
    end
    add_index :shuffle_gifts, :created_at
    add_foreign_key :shuffle_gifts, :users
    add_foreign_key :shuffle_gifts, :user_gift_requestings
  end
end
