class LineEventManager
  class Message::Text::User::AboutUser
    class Confirm < Base
      def self.match?(text, line_source:)
        text == "「#{line_source.user.name}」で合ってるよ！"
      end

      private

      def message_attributes
        [
          {
            type: 'text',
            text: first_text,
          },
          {
            type: 'text',
            text: second_text,
          },
          {
            type: 'text',
            text: third_text,
          },
        ]
      end

      def first_text
        <<~EOS
          #{user.name}さん！
          名前教えてくれてありがとうございます！#{0x10008D.chr('UTF-8')}
        EOS
          .chomp
      end

      def second_text
        <<~EOS
          ご挨拶遅れました！縦だか横だか分からないと噂のよこぴーです#{0x10008D.chr('UTF-8')}
          クリスマスの交換用のプレゼントはもう購入済みですか？
          もしよかったら私が働いているgifteeでも購入可能なので使ってみてください！笑
          https://giftee.com/

          他にもテキストで送れるものであれば対応できます！
          実物で！っていう方は交換相手がわかってから郵送してもらえれば大丈夫？？？？だと思います(きっと)
        EOS
          .chomp
      end

      def third_text
        <<~EOS
          プレゼントの用意ができたら「#{Message::Text::User::Gift::Onboarding::KEYWORD}」を入力してプレゼントの登録をお願いします！
        EOS
          .chomp
      end
    end
  end
end
