class CreateUserFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :user_follows do |t|
      t.references :user, index: { unique: true }

      t.timestamps
    end
    add_index :user_follows, :created_at
    add_foreign_key :user_follows, :users
  end
end
