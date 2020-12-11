class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :group_uid, null: false
    end
    add_index :groups, :group_uid, unique: true
  end
end
