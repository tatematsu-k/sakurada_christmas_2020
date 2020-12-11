class LineEventManager
  class Message::Image < Message
    STAMP_CANDIDATES = [
      {
        packageId: 11537,
        stickerId: 52002744,
      },
      {
        packageId: 11537,
        stickerId: 52002751,
      },
      {
        packageId: 11537,
        stickerId: 52002750,
      },
      {
        packageId: 11537,
        stickerId: 52002754,
      },
      {
        packageId: 11538,
        stickerId: 51626519,
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
        ごめんなさぃぃぃぃぃ！！！！！
        画像は理解できないの
      EOS
        .chomp
    end

    def stamp_hash
      STAMP_CANDIDATES.sample.merge(type: "sticker")
    end
  end
end
