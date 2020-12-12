class LineEventManager
  class Message::Text < Message
    attribute :text, :string

    def self.factory(line_source: line_source, **args)
      case line_source
      when LineSource::User
        User.new(line_source: line_source, **args)
      when LineSource::Group
        Group.new(line_source: line_source, **args)
      end
    end
  end
end
