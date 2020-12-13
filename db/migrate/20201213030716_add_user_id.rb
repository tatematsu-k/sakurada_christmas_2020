class AddUserId < ActiveRecord::Migration[6.0]
  def change
    add_reference :group_start_christmas_events, :users, null: false
    add_reference :group_shuffle_events, :users, null: false
  end
end
