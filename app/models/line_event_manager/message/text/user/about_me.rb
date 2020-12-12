class LineEventManager
  class Message::Text::User::AboutMe
    MATCH_STRINGS = [
      /立松/, /年齢/, /体重/, /血液型/, /大学/, /好きな食べ物/
    ]

    def self.match?(text)
      MATCH_STRINGS.any? do |reg|
        text.match?(reg)
      end
    end

    def self.message_attributes(text)
      reply_text =
        case text
        when /年齢/
          <<~EOS
            年齢は27歳です！
            1993/09/25の酉年！みなさんの一つ下です〜
          EOS
            .chomp
        when /体重/
          <<~EOS
            内緒だよ笑♡
            男の子にそんなこと聞いちゃいけません！#{0x100082.chr('UTF-8')}
            最近久しぶりに体重計に乗ったらめっちゃ痩せましたw
          EOS
        when /血液型/
          "B型です！"
        when /大学/
          <<~EOS
            大学は横浜国立大学です！
            数学科みたいなところ卒業しました！
          EOS
            .chomp
        when /好きな食べ物/
          <<~EOS
            食べ物めっちゃ好きです！
            焼肉・お寿司・ラーメン・チーズ・味噌もうなんでも好きです#{0x100078.chr('UTF-8')}
            でもお酒はすっっごい弱いです#{0x100094.chr('UTF-8')}
          EOS
            .chomp
        when /立松/
          "正解！！名前覚えてくれたんですね！ありがとうございます！"
        end
      [
        {
          type: 'text',
          text: "ひょっとして私のことですか！？#{0x10002E.chr('UTF-8')}",
        },
        {
          type: 'text',
          text: reply_text,
        }
      ]
    end
  end
end
