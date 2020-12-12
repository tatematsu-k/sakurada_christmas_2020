class LineEventManager
  class Unfollow < Base
    attribute :user

    def self.factory(event, line_source:)
      new(user: line_source.user)
    end

    def call
      user.follow.create_unfollow!
    end
  end
end
