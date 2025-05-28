require './user.rb'
require './csv_wrapper.rb'
require './file_wrapper.rb'

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

# user.jsonファイルの作成
json_file = 'user.json'

# FileWrapperインスタンスを作成しjsonファイルをopenにする
file_wrapper = FileWrapper.new(json_file)

# ユーザー情報を格納するための空のhashを作成
users = {}

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

    # JSONファイルに保存するユーザー情報を格納
    users[row['id']] = {
        "name" => user.name,
        "address" => user.get_full_address,
        "birthday" => user.birthday.strftime("%Y年%m月%d日"),
        "age" => user.get_age,
    }
end

# jsonファイルに書き込みを行う
file_wrapper.write_json(users)

# ファイルを閉じて保存する
file_wrapper.file.close
