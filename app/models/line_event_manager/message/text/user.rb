class LineEventManager
  class Message::Text::User < Message::Text
    delegate :user, to: :line_source

    def self.factory(text:, line_source:, **args)
      klass =
        [AboutUser, Gift, AboutMe, Unknown]
          .select{ |k| k.match?(text, line_source: line_source) }
          .first
      klass.factory(text: text, line_source: line_source, **args)
    end

    def call
      text_message = create_text_message!
      yield(text_message) if block_given?
      p "request with: #{message_attributes}"
      res = client.reply_message(reply_token, message_attributes)
      p res
      p res.body
    end

    private

    def create_text_message!
      line_source.user.text_messages.create!(text: text)
    end

    def client
      LineClientFactory.get
    end
  end
end
