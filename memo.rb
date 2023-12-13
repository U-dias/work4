require "csv"

# コンソールで入力
def make_memo
 print"出力するコンテンツ(Ctrl+Dで入力終了):"
 contents=STDIN.read
end

#ファイルの名前
def file_name
 print"ファイル名:"
 name=gets.chomp
 if FileTest.exist?(name + ".csv") then
    print "既にファイルがあります。"
    return
 else
    File.rename("memo.csv", name+".csv")
end
end

# 新規ファイルで出力
def made_memo(memo)
 CSV.open("memo.csv", "w") do |csv|
  csv<< memo
 end
end

# ファイルの末尾に追加
def add_memo(memo)
 print "ファイル名:"
 file=gets.chomp
 if FileTest.exist?( file + ".csv" ) then
    CSV.open( file + ".csv", "a" ) do |csv|
    csv<< memo
 end
 else
    FileTest.exist?( file)
    print "ファイルが見つかりません"
 end
 end

memos=[]

while true
 puts"新規作成は[1]"
 puts"CSVファイルの編集は[2]"
 puts"終了は[end]"
 mode=gets.chomp
 
 
 if mode=="1"
    memos.push(make_memo)
    made_memo(memos)
    file_name
    memos.clear
 elsif mode=="2"
    memos.push(make_memo)
    add_memo(memos)
    memos.clear
 elsif mode!="1" && mode!="2" && mode!="end"
    puts"不明な入力です。再入力して下さい。"
 else
    mode=="end"
    break
 end
end