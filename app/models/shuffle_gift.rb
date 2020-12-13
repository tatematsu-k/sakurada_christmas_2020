class ShuffleGift < ApplicationRecord
  belongs_to :user
  belongs_to :user_gift_requesting, class_name: "User::GiftRequesting"

  validate :not_same_user_validity

  private

  def not_same_user_validity
    return unless user.id == user_gift_requesting.user_id

    errors.add(:user, :provider_same)
  end
end
