class LineEventManager
  class Message::Text::User::Gift
    class Base < Message::Text::User::Gift
      def self.factory(**args)
        new(**args)
      end
    end
  end
end