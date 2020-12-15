class LineEventManager
  class Postback::SantaPresent < Postback::Base
    KEYWORD = "santa_present"

    def self.match?(action:)
      action == KEYWORD
    end

    def call
      ::User.transaction do
        super
        delivery_santa_present!
        reply(message_attributes)
      end
    end

    private

    def message_attributes
      text = <<~EOS
        今日はありがとうございます！
        楽しんでくれていたら嬉しいです#{0x10007F.chr('UTF-8')}
        既にあっている方、まだお会いしたことない方いらっしゃいますが今後とも仲良くしていただけるとうれしです！#{0x100039.chr('UTF-8')}

        最後にささやかですがよこぴサンタからの贈り物も送らせてもらいました♪
        素敵なクリスマスを!#{0x10009D.chr('UTF-8')}
      EOS
        .chomp

      [
        {
          type: "text",
          text: text,
        },
        {
          type: "image",
          originalContentUrl: "http://drive.google.com/uc?export=view&id=16yGhP43nAQ9kcGfrTO5HpeZFanK0WRbK",
          previewImageUrl: "http://drive.google.com/uc?export=view&id=1tFJjWMYvPZCfcR6t2ZgbiXNSEUvkiizL"
        },
        {
          type: 'text',
          text: "※ このBotは直に反応しなくなります。皆さんのLINEにトーク履歴は残りますがシステムのデータは消すので、うっかりトーク履歴消しちゃったとかはお互いにサポートしあってください#{0x100098.chr('UTF-8')}",
        }
      ]
    end

    def delivery_santa_present!
      User.active.each do |user|
        user.santa_present&.create_delivering!
        push_message(user, delivery_message(user: user))
      end
    end

    def delivery_message(user:)
      action = {
        type: "uri",
        label: "中身を見てみる",
        uri: user.santa_present.url,
      }

      {
        type: "template",
        altText: "This is a buttons template",
        template: {
          type: "buttons",
          thumbnailImageUrl: "https://pinto.style/lacne/ownedmedia/upload/18-10-14-ct03.jpg",
          imageAspectRatio: "rectangle",
          imageSize: "cover",
          text: "サンタさんから何かが届いてます。",
          defaultAction: action,
          actions: [action]
        }
      }
    end
  end
end
