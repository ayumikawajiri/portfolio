type = [0, 10, 20]
job = [100, 110, 120, 130, 140, 150, 160, 170, 199]
house = [200, 210, 220, 299]
community = [300, 310, 320, 330, 340, 350, 0]

200.times do |i|
  Classified.seed(:id,
    {
      id: i + 1,
      type: 0,
      category: job[rand(job.length)],
      user_id: rand(2..21),
      city_id: rand(1..11),
      title: "#{ i + 1 }番目のお仕事",
      content: "#{ i + 1 }番目のお仕事です！
      			こんな人探してます！興味のある方がコメントか直接メールでご連絡ください！"
    }
  )
end


200.times do |i|
  Classified.seed(:id,
    {
      id: i + 201,
      type: 10,
      category: house[rand(house.length)],
      user_id: rand(2..21),
      city_id: rand(1..11),
      title: "#{ i + 1 }番目のシェアメイト募集",
      content: "#{ i + 1 }番目のシェアメイト募集です！
            こんな人探してます！興味のある方がコメントか直接メールでご連絡ください！"
    }
  )
end

200.times do |i|
  Classified.seed(:id,
    {
      id: i + 401,
      type: 20,
      category: community[rand(community.length)],
      user_id: rand(2..21),
      city_id: rand(1..11),
      title: "#{ i + 1 }番目の仲間募集",
      content: "#{ i + 1 }番目の仲間募集です！
            こんな人探してます！興味のある方がコメントか直接メールでご連絡ください！"
    }
  )
end