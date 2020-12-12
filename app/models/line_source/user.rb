class LineSource
  class User < Base
    def save!
      ::User.find_or_create_by!(line_uid: user_id)
    end
  end
end
