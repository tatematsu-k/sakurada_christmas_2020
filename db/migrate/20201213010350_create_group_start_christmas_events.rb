class CreateGroupStartChristmasEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :group_start_christmas_events do |t|
      t.references :group, null: false, index: { unique: true }

      t.timestamps
    end
    add_index :group_start_christmas_events, :created_at
    add_foreign_key :group_start_christmas_events, :groups
  end
end
