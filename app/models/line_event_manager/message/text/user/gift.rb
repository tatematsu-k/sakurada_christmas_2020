class LineEventManager
  class Message::Text::User::Gift
    def self.match?(text, line_source_user:)
      Onboarding.match?(text) || line_source_user.gift_requesting? || line_source_user.gift_confirming?
    end

    def self.message_attributes(text)
      if Onboarding.match?(text)
        Onboarding.message_attributes
      elsif line_source_user.gift_requesting?
      elsif line_source_user.gift_confirming?
      else
        raise ArgumentError
      end
    end
  end
end
