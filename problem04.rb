require './file_wrapper.rb'

# user.jsonファイルからユーザー情報を取得する
file_path = 'user.json'
file_wrapper = FileWrapper.new(file_path)
users_hash = file_wrapper.read_json

# 都道府県名ごとのユーザーを格納する空のhashを定義
pref_users = {}

# 都道府県名をキーにして配列をvalueにするhashを作成
users_hash.each do |id, info|
    pref = info['address'].match(/^.+?[都道府県]/).to_s

    # 都道府県のキーが作成されているかをチェック
    if pref_users.key?(pref)
        # 都道府県のキーにユーザー情報を追加
        pref_users[pref].push(info)
    else
        # 都道府県のキーを作成してユーザー情報を追加
        pref_users[pref] = [info]
    end
end

# 各都道府県別の平均年齢の一覧をcsvで保存するためのパスを指定
pref_user_file_path = 'pref_user.csv'

# 各都道府県の平均年齢を配列に格納する
pref_age_list = []

# 各都道府県ごとにユーザーの情報を取得して
pref_users.each do |pref, users|
    # 年齢の合計値を格納する
    total_age = 0

    # 都道府県ごとのユーザーの年齢の合計を計算
    users.each do |user|
        total_age += user['age']
    end

    # 平均を計算する
    age_average = total_age / users.size

    pref_age_list.push([pref, age_average])
end

# csvファイル書き込み用のインスタンスを作成
csv_file_wrapper = FileWrapper.new(pref_user_file_path)

# csvファイルに書き込み
csv_file_wrapper.write_csv(pref_age_list)
