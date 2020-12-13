class ChangeNotNullForShuffleGiftPusblishingTarget < ActiveRecord::Migration[6.0]
  def change
    change_column_null :shuffle_gift_publishings, :target, false
  end
end
