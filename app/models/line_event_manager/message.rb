class LineEventManager
  class Message < Base
    attribute :reply_token, :string
    attribute :id, :string
    attribute :line_source

    def self.factory(event, line_source:)
      case event.type
      when Line::Bot::Event::MessageType::Text
        Text.new(
          reply_token: event["replyToken"],
          id: event.message["id"],
          text: event.message["text"],
          line_source: line_source,
        )
      when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
        Image.new(
          reply_token: event["replyToken"],
          id: event.message["id"],
          line_source: line_source,
        )
      when Line::Bot::Event::MessageType::Sticker
        Sticker.new(
          reply_token: event["replyToken"],
          id: event.message["id"],
          line_source: line_source,
        )
      end
    end
  end
end
