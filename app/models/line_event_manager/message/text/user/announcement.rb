class LineEventManager
  class Message::Text::User::Announcement < Message::Text::User::Base
    def self.match?(text, **_args)
      text == "よこぴーサンタからのアナウンス"
    end

    def message_attributes
      first_text = <<~EOS
        あけましておめでとうございます！
        今年もよろしくお願いします#{0x10007F.chr('UTF-8')}
      EOS
        .chomp
      second_text = <<~EOS
        プレゼント登録は二つの内容を教えてください
        - 全体ラインにどんなプレゼントかを教える内容
        - 交換相手個別ラインで送るプレゼント情報

        当日は登録していないと進められないので早めにお願いします#{0x100094.chr('UTF-8')}
      EOS
        .chomp

      [
        {
          type: "text",
          text: first_text,
        },
        {
          type: "text",
          text: second_text,
        },
        {
          type: "template",
          altText: "よこぴサンタからのメッセージが来ているよ",
          template: {
            type: "buttons",
            thumbnailImageUrl: "https://i.ytimg.com/vi/vV47XHp84t4/hqdefault.jpg",
            imageAspectRatio: "rectangle",
            imageSize: "cover",
            text: "当日までに登録してね。ホッホッホー",
            actions: [
              {
                type: "message",
                label: "プレゼントを登録！",
                text: Message::Text::User::Gift::Onboarding::KEYWORD,
              },
              {
                type: "message",
                label: "プレゼント内容を確認！",
                text: Message::Text::User::Gift::Confirm::KEYWORD,
              },
              {
                type: "message",
                label: "プレゼント内容を変更！",
                text: Message::Text::User::Gift::Cancel::KEYWORD,
              },
            ],
          }
        }
      ]
    end
  end

  def call
    User.all.each do |u|
      push_message(u, message_attributes)
    end
  end
end
