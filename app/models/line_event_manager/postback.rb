class LineEventManager
  class Postback < Base
    ACTION_CLASSES = [Present, StartChristmas]

    def self.factory(event, line_source:)
      params = data_parse(event["postback"]["data"])
      ACTION_CLASSES
        .select { |k| k.match?(action: params[:action]) }
        .first
        .factory(
          reply_token: event["replyToken"],
          line_source: line_source,
          **params
        )
    end

    def self.data_parse(data)
      data.split('&').map { |p| p.split('=') }.to_h.symbolize_keys
    end
  end
end
