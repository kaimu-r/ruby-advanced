require 'csv'

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
