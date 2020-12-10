class LineEventManager
  class Follow < Base
    def self.factory(event, line_source:)
      klass =
        case line_source
        when LineSource::User
          User
        end
      klass.factory(event, line_source: line_source)
    end
  end
end
