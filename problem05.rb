require 'erb'
require './csv_wrapper.rb'
require './file_wrapper.rb'

# 出力するcsvファイルのパスを指定
csv_file_path = 'pref_user.csv'

# インスタンスを作成し、ファイルを読み込む
csv_wrapper = CSVWrapper.new(csv_file_path)

# csvのデータを出力するためのerbファイルを読み込む
index_erb = File.read('table.erb')

# erbテンプレートファイルのstringデータを取得
erb_string = ERB.new(index_erb).result(binding)

# 新しく作成するHTMLファイルのパスを指定
html_file_path = 'table.html'

# インスタンスを作成しhtmlファイルを作成
html_file_wrapper = FileWrapper.new(html_file_path)

# 書き込みを行う
html_file_wrapper.write(erb_string)
