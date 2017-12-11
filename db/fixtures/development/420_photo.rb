
100.times do |i|
  Photo.seed(:id,
    {
      id: i + 1,
      classified_id: rand(1..600),
      file: Rails.root.join("db/fixtures/photos/machine.jpeg").open
   }
  )
end