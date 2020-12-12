class LineEventManager
  class Message::Text::User::Unknown < Message::Text::User::Base
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
