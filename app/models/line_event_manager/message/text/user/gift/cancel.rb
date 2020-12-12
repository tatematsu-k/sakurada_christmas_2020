class LineEventManager
  class Message::Text::User::Gift
    class Cancel < Message::Text::User::Gift::Base
      KEYWORD = "プレゼントのキャンセルしたい"

      def self.match?(text, **_args)
        text == KEYWORD
      end

      def call
        ::User.transaction do
          super
          user.gift_requesting&.destroy!
        end
      end

      private

      def message_attributes
        text =
          <<~EOS
            #{user.gift_requesting ? "もらったプレゼント情報は削除しますね！" : "あれ？まだプレゼント情報が登録されていないようです"}
            プレゼント情報の登録は「#{Onboarding::KEYWORD}」って送ってくださいね！
          EOS

        {
          type: 'text',
          text: text,
        }
      end
    end
  end
end
