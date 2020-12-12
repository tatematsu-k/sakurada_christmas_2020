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
      "まず最初にお名前を教えてください！"
    end
  end
end
