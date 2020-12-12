class LineEventManager
  class Message::Text::Group < Message::Text
    def call
      create!
      p "request with: #{message_attributes}"
      p client.reply_message(reply_token, message_attributes)
    end

    private

    def create!
      line_source.group.text_messages.create!(
        user: line_source.user,
        text: text,
      )
    end

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
