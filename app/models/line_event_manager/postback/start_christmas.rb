class LineEventManager
  class Postback::StartChristmas < Postback::Base
    KEYWORD = 'start_christmas'

    def self.match?(action:)
      action == KEYWORD
    end

    def call
      
    end
  end
end
