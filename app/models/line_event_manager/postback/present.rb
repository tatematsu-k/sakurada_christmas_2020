class LineEventManager
  class Postback::Present < Postback::Base
    KEYWORD = 'present'

    attribute :target

    def self.match?(action:)
      action == KEYWORD
    end
  end
end
