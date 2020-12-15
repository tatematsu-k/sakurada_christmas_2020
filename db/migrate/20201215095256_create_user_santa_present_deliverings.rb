class CreateUserSantaPresentDeliverings < ActiveRecord::Migration[6.0]
  def change
    create_table :user_santa_present_deliverings do |t|
      t.references :user_santa_present, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
