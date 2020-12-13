class AddTargetToShuffleGiftPublishing < ActiveRecord::Migration[6.0]
  def change
    add_column :shuffle_gift_publishings, :target, :string, index: { unique: true }
  end
end
