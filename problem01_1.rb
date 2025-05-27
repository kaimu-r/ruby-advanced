require './user.rb'
require './csv_wrapper.rb'

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

# CSVWrapperクラスのインスタンスを生成
csv_wrapper = CSVWrapper.new(file_path)

# CSVファイルを読み込み、ヘッダーを有効にする
csv_data = csv_wrapper.read_csv(headers: true)

# ヘッダーを変換して各行をハッシュに変換
row_data = csv_wrapper.headers_converter(HEADER_MAPPING)

row_data.each do |row|
    # Userクラスのインスタンスを生成
    user = User.new(row['name'])
    
    # インスタンスのname属性を出力
    puts user.name
end
