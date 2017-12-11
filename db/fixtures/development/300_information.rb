array = [0,10,20,30,200]

100.times do |i|
  Information.seed(:id,
    {
      id: i + 1,
      category: array[rand(array.length)],
      user_id: 1,
      title: "#{ i + 1 }番目のお役立ち情報",
      content: "#{ i + 1 }番目のお役立ち情報！
      			こんなことで困ってませんか？詳しく解説します！"
    }
  )
end