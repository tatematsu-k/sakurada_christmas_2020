class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :group_uid, null: false

      t.timestamps
    end
    add_index :groups, :group_uid, unique: true
    add_index :groups, :created_at
  end
end
