class CreateUserSantaPresents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_santa_presents do |t|
      t.references :user, null: false, index: { unique: true }

      t.string :url, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
