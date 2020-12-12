class User::GiftRequesting::PrivateMessageUsing < ApplicationRecord
  belongs_to :user_gift_requesting,
             class_name: "User::GiftRequesting"
  belongs_to :user_text_message,
             class_name: "User::TextMessage",
             inverse_of: :user_gift_requesting_private_message_using
end
