class LineEventManager
  class Postback::Present < Postback::Base
    KEYWORD = 'present'

    attribute :target, :integer

    def self.match?(action:)
      action == KEYWORD
    end

    def call
      p attributes
    end
  end
end
