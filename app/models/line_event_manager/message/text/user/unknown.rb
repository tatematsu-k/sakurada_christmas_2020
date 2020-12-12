class LineEventManager
  class Message::Text::User::Unknown < Message::Text::User::Base
    def self.match?(_text, **_args)
      true
    end

    def message_attributes
      text = <<~EOS
        ごめんなさい！！
        まだそのメッセージに反応できないです#{0x10007C.chr('UTF-8')}
        メッセージの内容によってはいろいろな反応するかもなので楽しんでください！
      EOS
        .chomp

      [
        {
          type: 'text',
          text: text,
        },
      ]
    end
  end
end
