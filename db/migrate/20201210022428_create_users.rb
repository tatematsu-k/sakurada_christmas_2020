class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :line_uid, null: false

      t.timestamps
    end
    add_index :users, :line_uid, unique: true
    add_index :users, :created_at
  end
end
