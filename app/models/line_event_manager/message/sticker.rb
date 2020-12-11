class LineEventManager
  class Message::Sticker < Message
    STAMP_CANDIDATES = [
      {
        packageId: 11539,
        stickerId: 52114116,
      },
      {
        packageId: 11538,
        stickerId: 51626497,
      },
      {
        packageId: 11538,
        stickerId: 51626506,
      },
      {
        packageId: 11537,
        stickerId: 52002748,
      },
      {
        packageId: 11537,
        stickerId: 52002735,
      }
    ]

    def call
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
          text: text,
        },
        stamp_hash
      ]
    end

    def text
      <<~EOS
        スタンプ.....よくわかんないです笑
      EOS
        .chomp
    end

    def stamp_hash
      STAMP_CANDIDATES.sample.merge(type: "sticker")
    end
  end
end
