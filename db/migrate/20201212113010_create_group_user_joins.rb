class CreateGroupUserJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :group_user_joins do |t|
      t.references :group, null: false
      t.references :user, null: false

      t.timestamps
    end
    add_index :group_user_joins, :created_at
    add_index :group_user_joins, [:group_id, :user_id], unique: true
    add_foreign_key :group_user_joins, :groups
    add_foreign_key :group_user_joins, :users
  end
end
