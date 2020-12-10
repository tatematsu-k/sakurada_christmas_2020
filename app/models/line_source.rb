class LineSource
  class UnsupportedTypeError < StandardError
    def initialize(type:)
      super("type: #{type} is unsupported.")
    end
  end

  def self.factory(**event)
    klass =
      case event["type"]
      when "user"
        User
      when "group"
        Group
      when "room"
        Room
      else
        raise UnsupportedTypeError(type: event["type"])
      end
    klass.new(**args.deep_symbolize_keys)
  end
end
