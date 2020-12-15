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
      User::Follow::Unfollow.count == 0 && User.active.count == User.active.gift_requested.count
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
        Postback::Answer.new(target: 0).next_present_open_message_attribute
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
