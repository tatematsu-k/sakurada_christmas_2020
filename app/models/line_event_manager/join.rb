class LineEventManager
  class Join < Base
    def self.factory(event, line_source:)
      klass =
        case line_source
        when LineSource::Group
          Group
        end
      klass.factory(event, line_source: line_source)
    end
  end
end
