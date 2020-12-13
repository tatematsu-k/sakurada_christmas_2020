class AddUserId < ActiveRecord::Migration[6.0]
  def change
    add_reference :group_start_christmas_events, :user, null: false
    add_reference :group_shuffle_events, :user, null: false
    add_foreign_key :group_start_christmas_events, :users
    add_foreign_key :group_shuffle_events, :users
  end
end
