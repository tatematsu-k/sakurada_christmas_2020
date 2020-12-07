class LineEventsManager < ApplicationModel
  attribute :events, Array

  def call
    events.each do |event|
      line_source = LineSource.factory(event["source"])
      case event
      when Line::Bot::Event::Follow
        # User.create!
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = {
            type: 'text',
            text: event.message['text']
          }
          client.reply_message(event['replyToken'], message)
        when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
          response = client.get_message_content(event.message['id'])
          tf = Tempfile.open("content")
          tf.write(response.body)
        end
      end
    end
  end
end
