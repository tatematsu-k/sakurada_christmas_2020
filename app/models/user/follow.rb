class User::Follow < ApplicationRecord
  belongs_to :user
  has_one :unfollow,
          class_name: "User::Follow::Unfollow",
          inverse_of: :user_follow,
          foreign_key: :user_follow_id
end
