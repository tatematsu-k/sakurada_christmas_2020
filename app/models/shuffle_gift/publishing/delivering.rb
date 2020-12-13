class ShuffleGift::Publishing::Delivering < ApplicationRecord
  belongs_to :shuffle_gift_publishing,
             class_name: "ShuffleGift::Publishing"
end
