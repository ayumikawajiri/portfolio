2000.times do |i|
  Comment.seed(:id,
    {
      id: i + 1,
      classified_id: rand(1..600),
      nickname: "commenter#{ i + 1 }",
      email: "commenter#{ i + 1 }@commenter.com",
      message: "#{ i + 1 }番目のコメント！
      			  興味があります！
              詳細教えてください！！"
    }
  )
end