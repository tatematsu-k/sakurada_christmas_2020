class User::Follow::Unfollow < ApplicationRecord
  belongs_to :user_follow,
             class_name: "User::Follow",
             inverse_of: :unfollow
end
