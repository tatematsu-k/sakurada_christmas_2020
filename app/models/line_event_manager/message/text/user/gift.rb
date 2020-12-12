class LineEventManager
  class Message::Text::User::Gift < Message::Text::User::Base
    CANDIDATE_CLASSES = [Cancel, Onboarding]

    def self.factory(text: text, line_source: line_source, **args)
      klass =
        CANDIDATE_CLASSES
          .select { |k| k.match?(text, line_source: line_source) }
          .first
      klass.factory(text: text, line_source: line_source, **args)
    end

    def self.match?(text, line_source:)
      CANDIDATE_CLASSES.any? { |k| k.match?(text, line_source: line_source) }
    end
  end
end
