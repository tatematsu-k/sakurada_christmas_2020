class LineEventManager
  class Postback::StartChristmas < Postback::Base
    KEYWORD = 'start_christmas'

    def self.match?(action:)
      action == KEYWORD
    end

    def call
      return if group.start_christmas_event

      ::User.transaction do
        if valid?
          group.create_start_christmas_event!(
            user: user,
          )
          group.create_shuffle_event!(
            user: user,
          )
          ShuffleGift.shuffle!
          reply_shuffle_requesting
        else
          reply_any_user_not_requested
        end

        super
      end
    end

    private

    def valid?
      # 本当はgroup内のuserに絞って判定をしたいがGroup内のuser idを取得するAPIは申請しないといけないので
      User.active.count == User.active.gift_requested.count
    end

    def reply_shuffle_requesting
      text = <<~EOS
        準備が整ったみたいだね！
        そしたらいよいよプレゼント交換会の開始だよ！
      EOS
        .chomp

      reply([
        {
          type: 'text',
          text: text,
        },
        {
          type: 'sticker',
          packageId: 11537,
          stickerId: 52002748,
        },
        {
          type: "template",
          altText: "This is a buttons template",
          template: {
            type: "buttons",
            thumbnailImageUrl: "https://supenavi.com/blog/wp-content/uploads/2017/10/pixta_2066046_M.jpg",
            imageAspectRatio: "rectangle",
            imageSize: "cover",
            text: "クリスマスプレゼント交換会の始まりだよ！",
            defaultAction: {
              type: "postback",
              label: "まず一人目は？",
              data: "action=#{Postback::Present::KEYWORD}&target=1",
            },
            actions: [{
              type: "postback",
              label: "まず一人目は？",
              data: "action=#{Postback::Present::KEYWORD}&target=1",
            }]
          }
        }
      ])
    end

    def reply_any_user_not_requested
      text = <<~EOS
        まだ準備ができてない人がいるみたいだよ！
        みんなの準備ができたらもう一度ボタンを押してね！
      EOS
        .chomp

      reply([
        {
          type: 'text',
          text: text,
        },
      ])
    end

    def reply(message_attributes)
      p "request with: #{message_attributes}"
      res = client.reply_message(reply_token, message_attributes)
      p res
      p res.body
    end

    def client
      LineClientFactory.get
    end
  end
end
