class LineEventManager
  class Message::Text::User::Gift
    class Confirm < Message::Text::User::Gift::Base
      KEYWORD = "プレゼントの内容を確認"

      def self.match?(text, **_args)
        text == KEYWORD
      end

      private

      def message_attributes
        attributes = []

        if group_attributes
          attributes << group_attributes
          attributes << private_attributes if private_attributes
        else
          attributes << not_gift_requested_attribute
        end

        attributes.flatten
      end

      def group_attributes
        return nil unless user.gift_requesting_group_messaged?

        [
          {
            type: 'text',
            text: "↓櫻田LINEに投げられる内容です↓",
          },
          {
            type: 'text',
            text: user.gift_requesting.group_text_message,
          },
        ]
      end

      def private_attributes
        return nil unless user.gift_requesting_private_messaged?

        [
          {
            type: 'text',
            text: "↓交換相手に個別で投げられる内容です↓",
          },
          {
            type: 'text',
            text: user.gift_requesting.private_text_message,
          },
        ]
      end
    end

    def not_gift_requested_attribute
      text =
        <<~EOS
          あれ？まだプレゼント情報預かってないです#{0x100029.chr('UTF-8')}
          「#{Onboarding::KEYWORD}」と入力してプレゼント情報を登録してください！
        EOS
          .chomp

      {
        type: 'text',
        text: text,
      }
    end
  end
end
