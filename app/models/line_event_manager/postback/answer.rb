class LineEventManager
  class Postback::Answer < Postback::Base
    KEYWORD = 'answer'

    attribute :target, :integer

    delegate :publishing, prefix: true, to: :shuffle_gift
    delegate :user_gift_requesting, to: :shuffle_gift
    delegate :user, prefix: :gift_presenting, to: :user_gift_requesting

    def self.match?(action:)
      action == KEYWORD
    end

    def call
      ::ActiveRecord::Base.transaction do
        super
        shuffle_gift_publishing.create_delivering!
        push_message(shuffle_gift.user, delivery_message_attributes)

        reply(message_attributes)
      end
    end

    def next_present_open_message_attribute
      label = "#{next_target}人目は？"
      # ここのハードコーディング感は一旦目を瞑る
      text = [
        "クリスマスプレゼント交換会の始まりだよ！記念すべき最初の人は誰かな？",
        "プレゼント交換会はまだ続くよ！",
        "次の人は誰かな？",
        "みんな楽しんでくれてるかな？よこぴーサンタもワクワクしてるよ！",
        "もう五人目だね！楽しい時間は早いよぉ...残り半分も楽しんでいこう！",
        "残っている人は誰かな？気になる次のひとは！",
        "残り二人！次はどっちかな？？",
        "ついに最後だね！最後まで楽しもうね！"
      ][next_target - 1]
      data = "action=#{Postback::PresentOpen::KEYWORD}&target=#{next_target}"

      {
        type: "template",
        altText: "This is a buttons template",
        template: {
          type: "buttons",
          thumbnailImageUrl: thumbnail_image_url,
          imageAspectRatio: "rectangle",
          imageSize: "cover",
          text: text,
          defaultAction: {
            type: "postback",
            label: label,
            data: data,
          },
          actions: [{
            type: "postback",
            label: label,
            data: data,
          }]
        }
      }
    end

    private

    def message_attributes
      if ShuffleGift::Publishing.count == 0
        next_present_open_message_attribute
      elsif ShuffleGift.unpublished.count == 0
        [
          answer_message_attribute,
          santa_present_message_attribute
        ]
      else
        [
          answer_message_attribute,
          next_present_open_message_attribute
        ]
      end
    end

    def answer_message_attribute
      text = "#{target}人目のプレゼントは#{gift_presenting_user.name}さんでした！"

      {
        type: 'text',
        text: text,
      }
    end

    def delivery_message_attributes
      [
        {
          type: 'text',
          text: "#{gift_presenting_user.name}さんからプレゼントが届きました！",
        },
        {
          type: 'text',
          text: user_gift_requesting.private_user_text_message.text,
        }
      ]
    end

    def shuffle_gift
      @shuffle_gift ||= ShuffleGift::Publishing.find_by!(target: target).shuffle_gift
    end

    def next_target
      target + 1
    end

    def thumbnail_image_url
      [
        "https://event.spacemarket.com/magazine/wp-content/uploads/2019/10/30192313/0cc9f035bbe88dce8287808a9e6f3d16_m-960x640.jpg",
        "https://supenavi.com/blog/wp-content/uploads/2017/10/pixta_2066046_M.jpg",
        "https://www.brother.co.jp/-/media/cojp/product/printer/home/magazine/img/236/kiji_236_1.ashx",
        "https://www.arcriche.jp/wordpress/wp-content/uploads/2017/11/MISC.jpg",
        "https://www.jalan.net/news/img/2019/11/e243541a-640x443.jpg",
        "https://with-asset.chouseisan.com/uploads/2018/07/22130055/U7icqULnLJbVUwLsBUlNjLEBHg1fdY5zx59isINp-1400x933.jpeg",
        "https://static.retrip.jp/article/69670/images/6967083b9bb6c-22ee-40da-a763-caf6500451eb_m.jpg",
        "https://www.sparkling-lights.jp/labo/assets/uploads/2015/08/history2-01.jpg"
      ][target - 1]
    end

    def santa_present_message_attribute
      text = <<~EOS
        全員終わってしまいましたね...
        よこぴサンタがこちらをのぞいているよ...
      EOS
        .chomp
      label = "どうした？"
      data = "action=#{Postback::SantaPresent::KEYWORD}"

      {
        type: "template",
        altText: "This is a buttons template",
        template: {
          type: "buttons",
          thumbnailImageUrl: "https://illustrain.com/img/work/2016/illustrain01-christmas20.png",
          imageAspectRatio: "rectangle",
          imageSize: "cover",
          text: text,
          defaultAction: {
            type: "postback",
            label: label,
            data: data,
          },
          actions: [{
            type: "postback",
            label: label,
            data: data,
          }]
        }
      }
    end
  end
end
