class LineEventManager
  class Postback::PresentOpen < Postback::Base
    KEYWORD = 'present_open'

    attribute :target, :integer

    def self.match?(action:)
      action == KEYWORD
    end

    def call
      p attributes
    end

    def message_attribute(text:)
      {
        type: "template",
        altText: "This is a buttons template",
        template: {
          type: "buttons",
          thumbnailImageUrl: "https://supenavi.com/blog/wp-content/uploads/2017/10/pixta_2066046_M.jpg",
          imageAspectRatio: "rectangle",
          imageSize: "cover",
          text: text,
          defaultAction: {
            type: "postback",
            label: "まず人目は？",
            data: "action=#{Postback::PresentOpen::KEYWORD}&target=1",
          },
          actions: [{
            type: "postback",
            label: "まず人目は？",
            data: "action=#{Postback::PresentOpen::KEYWORD}&target=1",
          }]
        }
      }
    end

    private

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
