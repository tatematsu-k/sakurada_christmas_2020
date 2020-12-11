class LineEventManager
  class Join::Group < Base
    attribute :reply_token, :string
    attribute :group_id, :string
    def self.factory(event, line_source:)
      new(
        reply_token: event["replyToken"],
        group_id: line_source.group_id,
      )
    end

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
          text: first_text,
        },
        {
          type: 'text',
          text: second_text,
        },
        {
          type: 'text',
          text: third_text,
        }
      ]
    end

    def first_text
      <<~EOS
        ついに！よこぴー櫻田デビュー笑#{0x10007A.chr('UTF-8')}
      EOS
        .chomp
    end

    def second_text
      <<~EOS
        今回はよこぴーサンタさんのプレゼント交換会にようこそ！
        みなさん事前にURLは送ってくれたかな。。。？
        (まだ送ってないよっていう人はこそっと送ってね！！！)

        このプレゼント交換会はよこぴーサンタと友達じゃないと参加できないからブロックした人はブロック解除してね#{0x10007C.chr('UTF-8')}
      EOS
        .chomp
    end

    def third_text
      <<~EOS
        準備ができたらみんなで「プレゼント交換開始！」ってこのグループに送ってね！
      EOS
        .chomp
    end
  end
end