class LineEventManager < ApplicationModel
  attribute :event

  def call
    line_source.save!
    klass =
      case event
      when Line::Bot::Event::Follow
        Follow
      when Line::Bot::Event::Unfollow
        Unfollow
      when Line::Bot::Event::Join
        Join
      when Line::Bot::Event::Message
        Message
      when Line::Bot::Event::Postback
        Postback
      end
    klass.factory(event, line_source: line_source).call
  end

  private

  def line_source
    @line_source ||= LineSource.factory(**event["source"].deep_symbolize_keys)
  end
end
