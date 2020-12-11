class LineSource
  class Group < Base
    attribute :groupId

    alias group_id groupId

    def save!
      ActiveRecord::Base.transaction do
        ::User.find_or_create_by!(line_uid: user_id)
        ::Group.find_or_create_by!(group_uid: group_id)
      end
    end
  end
end
