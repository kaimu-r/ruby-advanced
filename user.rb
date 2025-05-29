require 'date'

class User
    # 【参照 Moduleクラス attr_accessor】https://docs.ruby-lang.org/ja/latest/method/Module/i/attr_accessor.html
    attr_accessor :name, :birthday

    # Userクラス内の独自例外クラス
    # 年齢が18歳未満のユーザーの登録が行われた場合に例外を投げる
    class UnderageError < StandardError
        def initialize(msg = "18歳未満のユーザーは登録できません")
            super(msg)
        end
    end

    def initialize(name, address1, address2, address3, address4, address5, birthday)
        # インスタンス変数の初期化
        @name = name
        @address1 = address1
        @address2 = address2
        @address3 = address3
        @address4 = address4
        @address5 = address5

        # 生年月日をDateオブジェクトとして保存する
        date_list = birthday.split('/')
        @birthday = Date.new(date_list[0].to_i, date_list[1].to_i, date_list[2].to_i)
    end

    def get_full_address
        # 住所を結合して返す
        # compactはnilを処理するために使用している
        [@address1, @address2, @address3, @address4, @address5].compact.join
    end

    def get_age
        # 生年月日から年齢を計算して返す
        today = Date.today
        age = today.year - @birthday.year

        # 今年の生年月日がまだ来ていない人は年齢を1歳引く
        if (today.month < @birthday.month) || (today.month == @birthday.month && today.day < @birthday.day)
            age -= 1
        end

        # 年齢を返す
        age
    end
end
