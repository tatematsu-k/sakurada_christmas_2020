class RenameTableShuffleGiftPublishingDelivering < ActiveRecord::Migration[6.0]
  def change
    rename_table :shuffle_gift_publishing_delivering, :shuffle_gift_publishing_deliverings
  end
end
