class User < ApplicationRecord
  def gift_requesting?
    false
  end

  def gift_confirming?
    false
  end
end
