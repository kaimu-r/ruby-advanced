require "nokogiri"
require "open-uri"
require "uri"

# 画像URLを取得するwebページのURLを定義
base_url = "https://www.kurobe-dam.com/"

# Nokogiriを使って指定したURLのHTMLを取得し、パースした結果をdocに格納
doc = Nokogiri::HTML(URI.open(base_url))

# ページ内の拡張子が.pngの画像タグを全て取得
imgs = doc.css('img[src$=".png"]')

# 取得した画像タグそれぞれに対して、URLを生成して出力
imgs.each do |img|
    puts URI.join(base_url, img['src'])
end
