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
  delegate :user_text_message, prefix: :group, allow_nil: true, to: :group_message_using
  delegate :user_text_message, prefix: :private, allow_nil: true, to: :private_message_using

  def group_messaged?
    group_message_using.present?
  end

  def private_messaged?
    private_message_using.present?
  end

  def group_text_message
    group_user_text_message.text
  end

  def private_text_message
    private_user_text_message.text
  end
end
