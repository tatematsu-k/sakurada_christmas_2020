class LineEventManager
  class Message::Text::User
    class AboutUser::Base < AboutUser
      def self.factory(**args)
        new(**args)
      end
    end
  end
end
