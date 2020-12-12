class LineEventManager
  class Message::Text::User::Gift
    class Onboarding < Message::Text::User::Gift::Base
      KEYWORD = "交換プレゼントを送るよ！"

      def self.match?(text, **_args)
        text == KEYWORD
      end

      def call
        ::User.transaction do
          user.create_gift_requesting!
          super
        end
      end

      private

      def message_attributes
        first_text = <<~EOS
          了解です！
          次のステップでプレゼントの情報を教えてください！
          間違えた場合にはキャンセルもできるから安心してください！

          ステップ1:
          あげるプレゼントがどんなものなのかみんなに教えるようのテキストを教えてください！URLとか貼ってくれても大丈夫です！
          誰からのプレゼントかは内緒だから文体とかでバレないようにね#{0x10008C.chr('UTF-8')}
          このメッセージは当日櫻田LINEに送られるから注意してください

          ステップ2:
          交換相手に送るためのプレゼントの情報(URLやコードとか)を教えてください！
          郵送する時とかはその旨書いてあげてください！
        EOS
          .chomp
        second_text =
          <<~EOS
            そしたらステップ1です！
            櫻田LINEに送るようのギフトに関する説明文をメッセージで送ってください！

            ※ 後から登録した内容を確認したくなった場合は「#{Confirm::KEYWORD}」と送ってください！
            ※ もしキャンセルしたい時には「#{Cancel::KEYWORD}」と送ってください！キャンセルした場合は最初からやり直しになります#{0x10007C.chr('UTF-8')}
          EOS
            .chomp

        [
          {
            type: 'text',
            text: first_text,
          },
          {
            type: 'text',
            text: second_text,
          },
        ]
      end
    end
  end
end
