class CreateGroupShuffleEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :group_shuffle_events do |t|
      t.references :group, null: false, index: { unique: true }

      t.timestamps
    end
    add_index :group_shuffle_events, :created_at
    add_foreign_key :group_shuffle_events, :groups
  end
end
