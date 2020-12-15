class User::SantaPresent < ApplicationRecord
  belongs_to :user
  has_one :delivering,
          class_name: "User::SantaPresent::Delivering",
          inverse_of: :user_santa_present,
          foreign_key: :user_santa_present_id
end
