class WebhooksController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head 470
    end

    LineEventManager.new(events: client.parse_events_from(body)).call

    head 200
  end

  private

  def line_client
    LineClientFactory.get
  end
end
