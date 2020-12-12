class LineEventManager
  class Message::Text::User::Gift::PrivateMessage < Message::Text::User::Gift::Base
    def self.match?(_text, line_source:, **_args)
      user = line_source.user

      user.gift_requesting.present? && user.gift_requesting_group_messaged? && !user.gift_requesting_private_messaged?
    end

    def call
      ::User.transaction do
        super do |text_message|
          user.gift_requesting.create_private_message_using!(
            user_text_message: text_message,
          )
        end
      end
    end

    def message_attributes
      text =
        <<~EOS
          ありがとうございました！！
          プレゼントの登録が完了しました！

          内容を確認する時は「#{Message::Text::User::Gift::Confirm::KEYWORD}」と入力してください！
          内容を変更したい時には「#{Message::Text::User::Gift::Cancel::KEYWORD}」と入力してください
        EOS
          .chomp

      {
        type: 'text',
        text: text,
      }
    end
  end
end
