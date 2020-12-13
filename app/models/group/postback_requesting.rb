class Group::PostbackRequesting < ApplicationRecord
  belongs_to :group
  belongs_to :user, inverse_of: :group_postback_requestings
end
