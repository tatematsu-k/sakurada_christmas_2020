class CreateShuffleGiftPublishingDelivery < ActiveRecord::Migration[6.0]
  def change
    create_table :shuffle_gift_publishing_delivering do |t|
      t.references :shuffle_gift_publishing, null: false, index: { unique: true, name: :idx_shuffle_gift_publishing_delivering_1 }

      t.timestamps
    end
    add_index :shuffle_gift_publishing_delivering, :created_at, name: :idx_shuffle_gift_publishing_delivering_2
    add_foreign_key :shuffle_gift_publishing_delivering, :shuffle_gift_publishings, name: :fk_shuffle_gift_publishing_delivering_1
  end
end
