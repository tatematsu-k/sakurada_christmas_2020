class Group < ApplicationRecord
  has_many :text_messages
  has_many :postback_requestings
end
