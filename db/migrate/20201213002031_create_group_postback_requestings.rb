class CreateGroupPostbackRequestings < ActiveRecord::Migration[6.0]
  def change
    create_table :group_postback_requestings do |t|
      t.references :group, null: false
      t.references :user, null: false

      t.string :action, null: false

      t.timestamps
    end
    add_index :group_postback_requestings, :created_at
    add_foreign_key :group_postback_requestings, :groups
    add_foreign_key :group_postback_requestings, :users
  end
end
