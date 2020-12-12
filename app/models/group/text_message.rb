class Group::TextMessage < ApplicationRecord
  belongs_to :group
  belongs_to :user, inverse_of: :group_text_messages
end
