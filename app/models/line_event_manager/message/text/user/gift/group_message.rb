class LineEventManager
  class Message::Text::User::Gift::GroupMessage < Message::Text::User::Gift::Base
    def self.match?(_text, line_source:, **_args)
      user = line_source.user

      user.gift_requesting.present? && !user.gift_requesting_group_messaged?
    end

    def call
      ::User.transaction do
        super do |text_message|
          user.gift_requesting.create_group_message_using!(
            user_text_message: text_message,
          )
        end
      end
    end

    def message_attributes
      text =
        <<~EOS
          ありがとうございます！
          そしたら次はステップ2ですね！
          このメッセージは交換相手だけに送る内容になります。
          プレゼントのURLやコードなどを教えてください！
        EOS
          .chomp

      {
        type: 'text',
        text: text,
      }
    end
  end
end
