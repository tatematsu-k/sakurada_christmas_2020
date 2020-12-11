class LineEventManager < ApplicationModel
  attribute :event

  def call
    line_source.save!
    case event
    when Line::Bot::Event::Follow
      Follow.factory(event, line_source: line_source).call
    when Line::Bot::Event::Join
      Join.factory(event, line_source: line_source).call
    when Line::Bot::Event::Message
      Message.factory(event).call
    end
  end

  private

  def line_source
    @line_source ||= LineSource.factory(**event["source"].deep_symbolize_keys)
  end
end
