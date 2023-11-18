require "csv"

# コンソールで入力
def make_memo
 print"出力するコンテンツ:"
 contents=gets.chomp
 {"contents"=>contents}
end

#ファイルの名前
def file_name
 print"ファイル名:"
 name=gets.chomp #ここまでは問題なさそう
 File.rename("memo.csv", name+".csv")
end

# 新規ファイルで出力
def made_memo(memo)
 # print"ファイル名:"
 # name=gets.chomp
 # File.rename("memo.csv",name.csv)
 CSV.open("memo.csv", "w") do |csv|
  csv<<[memo]
 end
end

# ファイルの末尾に追加
def add_memo(memo)
 puts "内容:"
 CSV.open("memo.csv", "a" ) do |csv|
 csv<<[memo]
 end
end

memos=[]

while true
 puts"新規作成は[1]"
 puts"CSVファイルの編集は[2]"
 puts"ファイル名の変更は[3]"
 puts"終了は[end]"
 mode=gets.chomp
 
 
 if mode=="1"
    memos.push(make_memo)
    made_memo(memos)
 elsif mode=="2"
    memos.push(make_memo)
    add_memo(memos)
 elsif mode=="3"
    file_name
 elsif mode!="1" && mode!="2" && mode!="3" && mode!="end"
    puts"不明な入力です。再入力して下さい。"
 else
    mode=="end"
    break
 end
end