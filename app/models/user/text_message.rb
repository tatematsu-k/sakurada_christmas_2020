class User::TextMessage < ApplicationRecord
  belongs_to :user

  has_one :user_gift_requesting_group_message_using,
          class_name: "User::GiftRequesting::GroupMessageUsing",
          inverse_of: :user_text_message,
          foreign_key: :user_text_message_id
  has_one :user_gift_requesting_private_message_using,
          class_name: "User::GiftRequesting::PrivateMessageUsing",
          inverse_of: :user_text_message,
          foreign_key: :user_text_message_id
end
