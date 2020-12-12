class LineEventManager
  class Message::Text::User::Gift::Base < Message::Text::User::Gift
    def self.factory(**args)
      new(**args)
    end
  end
end