# 【課題01】
# 添付のCSVデータをRubyでパースして各列を以下の通りの命名規則で１行1ハッシュとして配列を生成し変数へ保存してください。
# その後、変数へ保存した配列をループで回し、名前のみを標準出力してください。

require 'csv'

# CSVファイルのパスを指定
file_path = 'data/personal_infomation (3).csv'

# 各列の命名規則を定義
HEADER_MAPPING = {
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

class CSVWrapper
    def initialize(file_path)
        # CSVファイルのパスを保存
        @file_path = file_path
    end
    
    def read_csv(headers: false)
        # CSVファイルの読み込み
        @table = CSV.read(@file_path, headers: headers)
    end

    def headers_converter(header_mapping)
        # 各行をハッシュに変換してヘッダーを変換する
        @table.map do |row|
            row.to_h.transform_keys { |key| header_mapping[key] || key }
        end
    end
end

# CSVWrapperクラスのインスタンスを生成
csv_wrapper = CSVWrapper.new(file_path)

# CSVファイルを読み込み、ヘッダーを有効にする
csv_data = csv_wrapper.read_csv(headers: true)

# ヘッダーを変換して各行をハッシュに変換
row_data = csv_wrapper.headers_converter(HEADER_MAPPING)

# 各行のnameキーの値を出力
row_data.each { |row| puts row['name'] }
