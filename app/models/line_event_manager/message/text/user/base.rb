class LineEventManager
  class Message::Text::User::Base < Message::Text::User
    def self.factory(**args)
      new(**args)
    end

    private

    def push_message(user, message_attributes)
      p "request push_message with: #{message_attributes}"
      res = client.push_message(user.line_uid, message_attributes)
      p res
      p res.body
    end
  end
end
