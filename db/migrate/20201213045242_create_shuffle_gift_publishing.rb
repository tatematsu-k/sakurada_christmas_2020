class CreateShuffleGiftPublishing < ActiveRecord::Migration[6.0]
  def change
    create_table :shuffle_gift_publishings do |t|
      t.references :shuffle_gift, null: false, index: { unique: true }

      t.timestamps
    end
    add_index :shuffle_gift_publishings, :created_at
    add_foreign_key :shuffle_gift_publishings, :shuffle_gifts
  end
end
