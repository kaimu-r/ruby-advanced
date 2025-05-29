require "json"
require "csv"

# ファイル操作をラップするクラス
class FileWrapper
    # 外部からFileオブジェクトを参照/変更できるようにする。
    attr_accessor :file

    def initialize(file_path)
        # ファイルが存在するかどうかの判定
        if File.exist?(file_path)
            # 既存ファイル → 先頭から読み書きできる
            mode = "r+"
        else
            # 無い場合 → 新しく作成して読み書き可にする
            mode = "w+"
        end

        # 指定モードでファイルを開き、Fileオブジェクトをインスタンス変数に保持
        @file = File.open(file_path, mode)
    end

    def read
        # ファイル内容を取得。stringを返す
        self.file.read
    end

    def read_json()
        str = self.read

        # ファイル内容をhashにして返す
        str.empty? ? {} : JSON.parse(str)
    end
    
    # 内容を保存
    def write(str)
        # ファイルを書き込んで返す
        self.file.write(str)
    end

    # HashをJSONに整形して書き込む
    def write_json(hash)
        # ファイルを書き込んで返す
        self.write(JSON.pretty_generate(hash))
    end

    # Arrayを文字列に変換・改行コードを入れてcsv書き込む
    def write_csv(rows, headers: nil)
        # csvファイルに書き込む用の改行コードを記述した文字列を定義
        csv_string = CSV.generate do |csv|
            # ヘッダーが存在する場合は一行目に追加
            if headers
                csv.add_row(headers)
            end

            # 配列を一行ずつ取得していく
            rows.each do |row|
                csv.add_row(row)
            end
        end

        # ファイルを書き込んで返す
        write(csv_string)
    end
end
