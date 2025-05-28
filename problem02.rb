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

# CSVWrapperクラスのインスタンスを生成し、ファイルを読み込む
csv_wrapper = CSVWrapper.new(file_path)

# ヘッダーを変換して各行をハッシュに変換
row_data = csv_wrapper.headers_converter(HEADER_MAPPING)

row_data.each do |row|
    # Userクラスのインスタンスを生成
    user = User.new(
        row['name'],
        row['address1'],
        row['address2'],
        row['address3'],
        row['address4'],
        row['address5'],
        row['birthday']
    )

    puts user.name
    puts user.get_full_address
    puts user.get_age
end
