class Group < ApplicationRecord
  has_many :text_messages
  has_many :postback_requestings
  has_one :start_christmas_event
  has_one :shuffle_event
end
