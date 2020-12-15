class LineEventManager
  class Postback::Base < Postback

    attribute :reply_token, :string
    attribute :line_source
    attribute :action, :string

    delegate :user, :group, to: :line_source

    def self.factory(**args)
      new(**args)
    end

    def call
      group.postback_requestings.create!(
        user: user,
        action: action,
      )
    end

    private

    def reply(message_attributes)
      p "request with: #{message_attributes}"
      res = client.reply_message(reply_token, message_attributes)
      p res
      p res.body
    end

    def push_message(user, message_attributes)
      p "request push_message with: #{message_attributes}"
      res = client.push_message(user.line_uid, message_attributes)
      p res
      p res.body
    end

    def client
      LineClientFactory.get
    end
  end
end
