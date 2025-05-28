require "json"

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
end


