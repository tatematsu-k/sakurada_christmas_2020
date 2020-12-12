class User < ApplicationRecord
  has_one :follow
  has_one :gift_requesting
  has_many :text_messages
  has_many :group_text_messages, class_name: "Group::TextMessage"

  def unfollow?
    follow&.unfollow.present?
  end

  def gift_requesting?
    false
  end

  def gift_confirming?
    false
  end
end
