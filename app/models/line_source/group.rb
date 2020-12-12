class LineSource
  class Group < Base
    attribute :groupId

    alias group_id groupId

    def group
      @group ||= ::Group.find_by!(group_uid: group_id)
    end

    def save!
      ActiveRecord::Base.transaction do
        ::User.find_or_create_by!(line_uid: user_id) if user_id
        ::Group.find_or_create_by!(group_uid: group_id)
      end
    end
  end
end
