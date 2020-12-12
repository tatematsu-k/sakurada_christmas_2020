class LineEventManager
  class Message::Text::User < Message::Text
    def call
      p "request with: #{message_attributes}"
      p client.reply_message(reply_token, message_attributes)
    end

    private

    def client
      LineClientFactory.get
    end

    def message_attributes
      if AboutMe.match?(text)
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
