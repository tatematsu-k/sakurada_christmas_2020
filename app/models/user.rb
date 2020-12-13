class User < ApplicationRecord
  has_one :follow
  has_one :info
  has_one :gift_requesting
  has_many :text_messages
  has_many :group_text_messages, class_name: "Group::TextMessage"
  has_many :group_postback_requestings, class_name: "Group::PostbackRequesting"

  delegate :group_messaged?,
           :private_messaged?,
           allow_nil: true,
           prefix: true,
           to: :gift_requesting
  delegate :name, allow_nil: true, to: :info

  def unfollow?
    follow&.unfollow.present?
  end
end
