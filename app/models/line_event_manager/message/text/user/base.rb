class LineEventManager
  class Message::Text::User::Base < Message::Text::User
    def self.factory(**args)
      new(**args)
    end
  end
end
