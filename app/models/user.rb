class User < ApplicationRecord
  has_one :archive
  has_one :follow
  has_one :info
  has_one :gift_requesting
  has_one :shuffle_gift
  has_many :text_messages
  has_many :group_text_messages, class_name: "Group::TextMessage"
  has_many :group_postback_requestings, class_name: "Group::PostbackRequesting"
  has_one :santa_present

  delegate :group_messaged?,
           :private_messaged?,
           allow_nil: true,
           prefix: true,
           to: :gift_requesting
  delegate :name, allow_nil: true, to: :info

  scope :active, -> {
    left_joins(:archive).merge(Archive.where(id: nil))
  }

  scope :gift_requested, -> {
    joins(gift_requesting: [:group_message_using, :private_message_using]).distinct
  }

  def unfollow?
    follow&.unfollow.present?
  end
end
