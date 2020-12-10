class LineEventManager
  class Message::Text < Message
    attribute :text, :string

    def call
      client.reply_message(reply_token, message_attributes)
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
