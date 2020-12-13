class ShuffleGift::Publishing < ApplicationRecord
  belongs_to :shuffle_gift
  has_one :delivering,
          class_name: "ShuffleGift::Publishing::Delivering",
          inverse_of: :shuffle_gift_publishing,
          foreign_key: :shuffle_gift_publishing_id
end
