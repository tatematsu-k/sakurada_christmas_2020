class LineEventManager
  class Follow::User::Reactive < Follow::User
    STAMP_CANDIDATES = [
      {
        packageId: 11537,
        stickerId: 52002750,
      },
      {
        packageId: 11537,
        stickerId: 52002746,
      },
      {
        packageId: 11538,
        stickerId: 51626522,
      }
    ]

    def call
      user.follow.unfollow.destroy!

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
        stamp_hash
      ]
    end

    def first_text
      <<~EOS
        ブロック....orz#{0x10007C.chr('UTF-8')}
        プレゼント交換が終わるまではこのアカウントが必要になるのでブロックしないでくれると嬉しいです#{0x100094.chr('UTF-8')}
        でもブロック解除してくれてありがとうございます#{0x10007A.chr('UTF-8')}
      EOS
        .chomp
    end

    def stamp_hash
      STAMP_CANDIDATES.sample.merge(type: "sticker")
    end
  end
end
