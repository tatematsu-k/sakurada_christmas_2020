class RefixUsersIndex < ActiveRecord::Migration[6.0]
  def change
    remove_index :users, :line_uid
    add_index :users, :line_uid
  end
end
