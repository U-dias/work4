def make_memo
 print"contents:"
 contents=gets.chomp
 memo={"contents"=>contents}
end

def show_memo(memos)
 puts "入力された内容"
 require"csv"
 CSV.open("memo.csv","wb") do |csv|
 csv<<[make_memo]
 end
end

memos=[]

while true
 puts"ターミナル上にメモは[add]"
 puts"CSVでメモを出力は[output]"
 puts"終了は[end]"
 mode=gets.chomp

 if mode=="add"
    memos.push(make_memo)
 elsif mode=="output"
    show_memo(memos)
 else
    mode=="end"
    break
 end
end