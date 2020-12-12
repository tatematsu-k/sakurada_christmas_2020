class User::GiftRequesting < ApplicationRecord
  belongs_to :user
  has_one :group_message_using,
          class_name: "User::GiftRequesting::GroupMessageUsing",
          inverse_of: :user_gift_requesting,
          foreign_key: :user_gift_requesting_id,
          dependent: :destroy
  has_one :private_message_using,
          class_name: "User::GiftRequesting::PrivateMessageUsing",
          inverse_of: :user_gift_requesting,
          foreign_key: :user_gift_requesting_id,
          dependent: :destroy

  def group_messaged?
    group_message_using.present?
  end

  def private_messaged?
    private_message_using.present?
  end
end
