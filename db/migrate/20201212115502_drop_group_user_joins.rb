class DropGroupUserJoins < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :group_user_joins, :groups
    remove_foreign_key :group_user_joins, :users
    remove_index :group_user_joins, :created_at
    remove_index :group_user_joins, [:group_id, :user_id]
    drop_table :group_user_joins
  end
end
