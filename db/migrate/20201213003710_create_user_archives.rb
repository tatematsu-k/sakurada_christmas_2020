class CreateUserArchives < ActiveRecord::Migration[6.0]
  def change
    create_table :user_archives do |t|
      t.references :user, null: false

      t.timestamps
    end
    add_index :user_archives, :created_at
    add_foreign_key :user_archives, :users
  end
end
