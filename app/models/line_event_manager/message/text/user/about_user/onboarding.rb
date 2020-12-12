class LineEventManager
  class Message::Text::User::AboutUser
    class Onboarding < Base
      def self.match?(_text, line_source:)
        line_source.user.info.nil?
      end

      def call
        ::User.transaction do
          user.create_info(name: text)
          super
        end
      end

      private

      def message_attributes
        confirm_message =
          <<~EOS
            「#{text}」さんでお間違い無かったですか？
            一度登録すると変更できないので確認をお願いします！
            プレゼント交換で利用するので櫻田で馴染みのある名前がいいと思います！
          EOS
            .chomp

        {
          type: "template",
          altText: "名前の確認モーダルです",
          template: {
            type: "confirm",
            text: confirm_message,
            actions: [
                {
                  type: "message",
                  label: "あってる！",
                  text: "「#{text}」で合ってるよ！"
                },
                {
                  type: "message",
                  label: "やっぱ変える",
                  text: Cancel::KEYWORD,
                }
            ]
          }
        }
      end
    end
  end
end
