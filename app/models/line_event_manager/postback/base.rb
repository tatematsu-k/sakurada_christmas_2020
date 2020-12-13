class LineEventManager
  class Postback::Base < Postback

    attribute :reply_token, :string
    attribute :line_source
    attribute :action, :string

    def self.factory(**args)
      new(**args)
    end

    def call
      
    end
  end
end
