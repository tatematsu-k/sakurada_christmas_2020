class LineEventManager
  class Message::Text::User::Unknown < Message::Text::User
    def self.factory(**args)
      new(**args)
    end

    def self.match?(_text, **_args)
      true
    end

    def message_attributes
      [
        {
          type: 'text',
          text: "ごめんなさい、、何言ってるのかわからないです...orz",
        },
      ]
    end
  end
end
