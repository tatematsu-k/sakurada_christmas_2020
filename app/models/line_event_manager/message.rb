module LineEventManager
  class Message < Base
    attribute :reply_token, String
    attribute :id, String

    def self.factory(event)
      case event.type
      when Line::Bot::Event::MessageType::Text
        Text.new(
          reply_token: event["replyToken"],
          id: event.message["id"],
          text: event.message["text"],
        )
        # message = {
        #   type: 'text',
        #   text: event.message['text']
        # }
        # client.reply_message(event['replyToken'], message)
      # when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
      #   response = client.get_message_content(event.message['id'])
      #   tf = Tempfile.open("content")
      #   tf.write(response.body)
      end
    end
  end
end
