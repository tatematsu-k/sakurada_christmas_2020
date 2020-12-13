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
  end
end
