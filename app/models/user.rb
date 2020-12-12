class User < ApplicationRecord
  has_many :text_messages
  has_many :group_text_messages, class_name: "Group::TextMessage"

  def gift_requesting?
    false
  end

  def gift_confirming?
    false
  end
end
