class LineEventsManager < ApplicationModel
  attribute :events

  def call
    events.each do |event|
      LineEventManager.new(event: event).call
    end
  end
end
