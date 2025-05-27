class User
    # 【参照 Moduleクラス attr_accessor】https://docs.ruby-lang.org/ja/latest/method/Module/i/attr_accessor.html
    attr_accessor :name

    def initialize(name)
        # インスタンス変数の初期化
        @name = name
    end
end
