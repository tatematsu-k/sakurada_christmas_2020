class CreateUserInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_infos do |t|
      t.references :user, index: { unique: true }
      t.string :name, null: false

      t.timestamps
    end
    add_index :user_infos, :created_at
    add_foreign_key :user_infos, :users
  end
end
