class CreateUserFollowUnfollows < ActiveRecord::Migration[6.0]
  def change
    create_table :user_follow_unfollows do |t|
      t.references :user_follow, index: { unique: true }

      t.timestamps
    end
    add_index :user_follow_unfollows, :created_at
    add_foreign_key :user_follow_unfollows, :user_follows
  end
end
