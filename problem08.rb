require "nokogiri"
require "open-uri"
require "uri"

# 画像URLを取得するwebページのURLを定義
base_url = "https://www.kurobe-dam.com/"

# Nokogiriを使って指定したURLのHTMLを取得し、パースした結果をdocに格納
doc = Nokogiri::HTML(URI.open(base_url))

# XPathを使用して取得する画像を指定
img = doc.xpath("//img[@src='/img/img_sightseeing.jpg']")

# 取得した画像タグのsrcを結像して出力
puts URI.join(base_url, img[0]['src'])
