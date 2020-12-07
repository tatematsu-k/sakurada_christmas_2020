class LineSource
  class UnsupportedTypeError < StandardError
    def initialize(type:)
      super("type: #{type} is unsupported.")
    end
  end

  def self.factory(**args)
    klass =
      case args["type"]
      when "user"
        User
      when "group"
        Group
      when "room"
        Room
      else
        raise UnsupportedTypeError(type: args["type"])
      end
    klass.new(**args.deep_symbolize_keys)
  end
end
