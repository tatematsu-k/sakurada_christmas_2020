class LineEventManager
  class Message < Base
    attribute :reply_token, :string
    attribute :id, :string

    def self.factory(event)
      case event.type
      when Line::Bot::Event::MessageType::Text
        Text.new(
          reply_token: event["replyToken"],
          id: event.message["id"],
          text: event.message["text"],
        )
      when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
        Image.new(
          reply_token: event["replyToken"],
          id: event.message["id"],
        )
      when Line::Bot::Event::MessageType::Sticker
        Sticker.new(
          reply_token: event["replyToken"],
          id: event.message["id"],
        )
      end
    end
  end
end
