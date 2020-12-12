class LineEventManager
  class Message::Text::User::AboutMe < Message::Text::User::Base
    MATCH_STRINGS = [
      /立松/, /年齢/, /身長/, /体重/, /血液型/, /大学/, /好きな食べ物/, /付き合った日/
    ]

    def self.match?(text, **_args)
      MATCH_STRINGS.any? do |reg|
        text.match?(reg)
      end
    end

    def message_attributes
      reply_text =
        case text
        when /年齢/
          <<~EOS
            年齢は27歳です！
            1993/09/25の酉年！みなさんの一つ下です〜
          EOS
            .chomp
        when /身長/
          <<~EOS
            身長は177cmです！
            地味に180届かない悲しさ...
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
        when /付き合った日/
          <<~EOS
            ピンクとは去年の11/22から付き合ってます。
            意図してなかったのですがいい夫婦の日だね笑って話しました
          EOS
            .chomp
        when /五反田/
          <<~EOS
            会社が五反田にあって今年の夏までは西五反田で一人暮らししてました！
            そしてピンクの苗字ですね笑#{0x100079.chr('UTF-8')}
            ピンクが「五反田が五反田に来たー」って喜んでた？のが面白かったです！
            戸越銀座のあたりに住んでいてれいさんの家と徒歩圏内だったのでびっくり！
            引っ越す直前に初めて櫻田の人と会えました！！
          EOS
            .chomp
        when /馴れ初め/
          <<~EOS
            ピンクが恥ずかしがって言わないのでそれを尊重しますw
            聞きたかったらピンクに聞いてくださ〜い
          EOS
            .chomp
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
