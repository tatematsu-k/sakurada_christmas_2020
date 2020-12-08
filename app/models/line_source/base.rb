class LineSource
  class Base < ApplicationModel
    attribute :type
    attribute :userId

    alias user_id userId
  end
end
