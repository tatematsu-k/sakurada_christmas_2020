class LineEventManager
  class Follow::User < Base
    attribute :reply_token, :string
    attribute :user
    def self.factory(event, line_source:)
      if line_source.user.unfollow?
        Reactive.new(
          reply_token: event["replyToken"],
          user: line_source.user,
        )
      else
        FirstFollow.new(
          reply_token: event["replyToken"],
          user: line_source.user,
        )
      end
    end
  end
end
