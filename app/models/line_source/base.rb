class LineSource
  class Base < ApplicationModel
    attribute :type
    attribute :userId

    alias user_id userId

    def user
      @user ||= ::User.find_by!(line_uid: user_id)
    end
  end
end
