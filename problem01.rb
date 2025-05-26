# 【課題01】
# 添付のCSVデータをRubyでパースして各列を以下の通りの命名規則で１行1ハッシュとして配列を生成し変数へ保存してください。
# その後、変数へ保存した配列をループで回し、名前のみを標準出力してください。

require 'csv'

# ヘッダーを適切なキーに変換する
HEADER_MAP = {
    'no' => 'id',
    'namae' => 'name',
    'rubi' => 'ruby',
    'seibetu' => 'sex',
    'denwa' => 'tel',
    'keitai' => 'mobile',
    'mairu' => 'mail',
    'jusho1' => 'address1',
    'jusho2' => 'address2',
    'jusho3' => 'address3',
    'jusho4' => 'address4',
    'jusho5' => 'address5',
    'tanjobi' => 'birthday'
}

# ヘッダーの変換用の関数
# 参考【Qiita】https://qiita.com/tyamagu2/items/950aad7e67de1592e9d3
converter = lambda { |header| HEADER_MAP[header] }
# p converter

# 参考【CSVクラスドキュメント】https://docs.ruby-lang.org/ja/latest/class/CSV.html#S_READ
# 参考【CSV.newメソッド】https://docs.ruby-lang.org/ja/latest/method/CSV/s/new.html
# 参考【CSV::HeaderConverters】https://docs.ruby-lang.org/ja/latest/method/CSV/i/header_converters.html
# CSVファイルを読み込み、各行をハッシュ値に変換する
table = CSV.read('data/personal_infomation (3).csv', headers: true, header_converters: converter)
# p table.class # => CSV::Table
# p CSV::HeaderConverters.keys # => [:downcase, :symbol]

table.each { |row| puts row['name'] }
