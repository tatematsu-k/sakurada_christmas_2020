class LineSource
  class User < Base
    delegate :gift_requesting?, :gift_confirming?, to: :user
    def user
      @user ||= ::User.find_by!(line_uid: user_id)
    end

    def save!
      ::User.find_or_create_by!(line_uid: user_id)
    end
  end
end
