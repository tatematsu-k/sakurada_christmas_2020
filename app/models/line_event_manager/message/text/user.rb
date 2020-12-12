class LineEventManager
  class Message::Text::User < Message::Text
    def call
      create!
      p "request with: #{message_attributes}"
      p client.reply_message(reply_token, message_attributes)
    end

    private

    def create!
      line_source.user.text_messages.create!(text: text)
    end

    def client
      LineClientFactory.get
    end

    def message_attributes
      if Gift.match?(text, line_source_user: line_source)
        Gift.message_attributes(text)
      elsif AboutMe.match?(text)
        AboutMe.message_attributes(text)
      else
        {
          type: 'text',
          text: "aaa",
        }
      end
    end
  end
end
