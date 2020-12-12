class LineEventManager
  class Message::Text::User::AboutUser
    class Cancel < Base
      KEYWORD = "ちょっと待った！！！やっぱり変えるよ！"

      def self.match?(text, line_source:)
        text == KEYWORD
      end

      def call
        ::User.transaction do
          user.info.destroy!
          super
        end
      end

      private

      def message_attributes
        {
          type: "text",
          text: "そしたらお名前もう一度入れてください！",
        }
      end
    end
  end
end
