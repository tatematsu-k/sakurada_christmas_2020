class User::GiftRequesting::GroupMessageUsing < ApplicationRecord
  belongs_to :user_gift_requesting,
             class_name: "User::GiftRequesting"
  belongs_to :user_text_message,
             class_name: "User::TextMessage",
             inverse_of: :user_gift_requesting_group_message_using
end
