class LineEventManager
  class Postback::StartChristmas < Postback::Base
    KEYWORD = 'start_christmas'

    def self.match?(action:)
      action == KEYWORD
    end

    def call
      ::User.transaction do
        if valid?
        else
        end

        super
      end
    end

    private

    def valid?
      # 本当はgroup内のuserに絞って判定をしたいがGroup内のuser idを取得するAPIは申請しないといけないので
      User.active.count == User.active.gift_requested.count
    end
  end
end
