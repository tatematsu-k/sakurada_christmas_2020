class LineEventManager
  class Follow::User::FirstFollow < Follow::User
    def call
      user.create_follow!

      p "request with: #{message_attributes}"
      res = client.reply_message(reply_token, message_attributes)
      p res
      p res.body
    end

    private

    def client
      LineClientFactory.get
    end

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
        友達登録してくれてありがとうございます#{0x100080.chr('UTF-8')}
        これは櫻田用にサクッと作ったアプリです！
        だから変な不具合とかあったらごめんなさい#{0x10008E.chr('UTF-8')}
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
