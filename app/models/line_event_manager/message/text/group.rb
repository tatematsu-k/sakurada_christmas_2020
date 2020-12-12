class LineEventManager
  class Message::Text::Group < Message::Text
    def call
      p "request with: #{message_attributes}"
      p client.reply_message(reply_token, message_attributes)
    end

    private

    def client
      LineClientFactory.get
    end

    def message_attributes
      {
        type: 'text',
        text: text,
      }
    end
  end
end
