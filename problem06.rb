require './user.rb'

begin
  user = User.new("Taro", "東京都", "新宿区", nil, nil, nil, "2015/01/01")
  puts "登録完了！"
rescue User::UnderageError => e
  puts e.message
end
