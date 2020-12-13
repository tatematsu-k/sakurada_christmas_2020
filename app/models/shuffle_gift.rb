class ShuffleGift < ApplicationRecord
  belongs_to :user
  belongs_to :user_gift_requesting, class_name: "User::GiftRequesting"
  has_one :publishing

  validate :not_same_user_validity

  def self.shuffle!
    raise unless User.active.count == User.active.gift_requested.count
    users = User.active.to_a.shuffle
    user_gift_requestings = User.active.preload(:gift_requesting).to_a.map(&:gift_requesting).shuffle

    transaction do
      users.count.times do |i|
        create!(user: users[i], user_gift_requesting: user_gift_requestings[i])
      end
    end
  rescue ActiveRecord::RecordInvalid
    p "retry"
    transaction do
      ShuffleGift.destroy_all
      shuffle!
    end
  end

  private

  def not_same_user_validity
    return unless user.id == user_gift_requesting.user_id

    errors.add(:user, :provider_same)
  end
end
