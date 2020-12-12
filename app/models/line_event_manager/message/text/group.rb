class LineEventManager
  class Message::Text::Group < Message::Text
    def call
      create_text_message!
    end

    private

    def create_text_message!
      line_source.group.text_messages.create!(
        user: line_source.user,
        text: text,
      )
    end
  end
end
