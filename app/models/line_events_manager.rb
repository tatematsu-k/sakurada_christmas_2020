class LineEventsManager < ApplicationModel
  attribute :events, Array

  def call
    events.each do |event|
      LineEventManager.new(event: event).call
    end
  end
end
