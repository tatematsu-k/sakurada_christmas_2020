class LineEventManager
  class Postback::PresentOpen < Postback::Base
    KEYWORD = 'present_open'

    attribute :target, :integer

    delegate :user_gift_requesting, to: :shuffle_gift

    def self.match?(action:)
      action == KEYWORD
    end

    def call
      ::ActiveRecord::Base.transaction do
        super
        shuffle_gift.create_publishing!(target: target)
        reply(message_attribute)
      end
    end

    private

    def message_attribute
      text = <<~EOS
        #{shuffle_gift.user.name}さんへのプレゼントだよ！
        このプレゼントを用意したサンタさんは誰かな？
      EOS
        .chomp

      [
        {
          type: 'text',
          text: text,
        },
        {
          type: 'text',
          text: user_gift_requesting.group_user_text_message.text,
        },
        answer_postback_message
      ]
    end

    def shuffle_gift
      @shuffle_gift ||= ShuffleGift.unpublished.sample
    end

    def answer_postback_message
      data = "action=#{Postback::Answer::KEYWORD}&target=#{target}"

      {
        type: "template",
        altText: "よこぴサンタからのメッセージが来ているよ",
        template: {
          type: "buttons",
          thumbnailImageUrl: thumbnail_image_url,
          imageAspectRatio: "rectangle",
          imageSize: "cover",
          text: "このプレゼントは誰からかな？",
          defaultAction: {
            type: "postback",
            label: "サンタさんだ〜れだ！",
            data: data,
          },
          actions: [{
            type: "postback",
            label: "サンタさんだ〜れだ！",
            data: data,
          }]
        }
      }
    end

    def thumbnail_image_url
      [
        "https://cdn.omni-links.com/tourimages/thumb/7c4dbe190420a5b376ad154e8a0bf9be_thumb_1680x1280.jpg",
        "https://www.iwasebooks.co.jp/wp-content/uploads/2017/11/thumb3.jpg",
        "https://imgc.eximg.jp/i=https%253A%252F%252Fs.eximg.jp%252Fexpub%252Ffeed%252FItMama%252F2016%252FItMama_43321%252FItMama_43321_1.jpg",
        "https://www.ei-navi.jp/resources/uploads/2015/12/20151222-01.jpg",
        "https://mimily.jp/wp-content/uploads/2015/12/santa_1449465339-1024x6811-1024x681.jpg",
        "https://limo.ismcdn.jp/mwimgs/c/f/-/img_cf816575887d025618a1fdafa5d0303b232655.jpg",
        "https://d1uzk9o9cg136f.cloudfront.net/f/16783100/rc/2017/12/22/4514bb35752f2e0fc425de3325d8a671e0d64dad_xlarge.jpg",
        "https://yolo-english.jp/wp-content/uploads/2015/10/shutterstock_751379434.jpg"
      ][target - 1]
    end
  end
end
