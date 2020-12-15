class User::SantaPresent::Delivering < ApplicationRecord
  belongs_to :user_santa_present,
             class_name: "User::SantaPresent"
end
