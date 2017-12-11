
City.seed(:id,
  { id: 1, 
    name: "Alice Springs", 
    state: 0,
    introduction: "オーストラリアの中心にあるあの有名なエアーズロックから一番近い場所にある街です。
                  エアーズロックへ向かう多くのバックパッカーが経由地として滞在します。
                  周囲は赤い砂漠で囲まれていて、日本ではまず見れない壮大な景色に圧倒されることでしょう。
                  ここにはオーストラリアの先住民アボリジニも居住していて、彼らの独特なアボリジニアートにも触れることができます。
                  オーストラリアに滞在するからには一度は行ってみたい、そして行って欲しい場所のひとつです。",
                  image: Rails.root.join("db/fixtures/photos/alicesprings.JPG").open
    },
  { id: 2, 
    name: "Darwin", 
    state: 0,
    introduction: "オーストラリアの最北端に位置するダーウィンはノーザンテリトリーの州都です。
                  先住民アボリジニのふるさとであるカカドゥ国立公園など大自然をめぐる多くのツアーがここダーウィンを拠点として催行されています。
                  中でも港から眺めるサンセットは素晴らしい景観で、クルージングのツアーが非常に人気です。
                  他にも10,000匹以上のワニが自然に近い状態で見られるクロコディラスパークなど、魅力溢れるアクティビティが満載のため、観光に是非オススメしたい街のひとつです。",
                  image: Rails.root.join("db/fixtures/photos/darwin.jpg").open
    },
  { id: 3, 
    name: "Byron Bay", 
    state: 10,
    introduction: "ゴールドコーストから約1時間ほどの小さな街です。
                  オーストラリア最東端ポイントがあり観光客も訪れる場所。写真はその最東端にある灯台です。
                  日本人が少なくのんびりした街なので、都会の喧騒から離れて日本人のあまりいない環境で生活したい方にオススメ。
                  ただし小さな街なので仕事を探したい方には少しハードルが高くなるかもしれません。
                  日本人が少ない分英語力もそれなりに求められますが、あえて甘えられない環境にいることで英語力も生活力も身につくことでしょう。",
                  image: Rails.root.join("db/fixtures/photos/byronbay.jpg").open
    },
  { id: 4, 
    name: "Sydney", 
    state: 10,
    introduction: "シドニーという都市名を聞いたことがない人はいないと言っても過言ではないほど、世界的に有名な大都市です。
                  日本人を含め海外からの移民が多く外国人慣れしていて、日本人向けのお店やコミュニティも多くあるため初めての海外生活が不安という方にはオススメの街。
                  年末のカウントダウン花火はとても有名で、毎年大晦日は明け方から場所取りをしている人たちがいるほどです。
                  海も近く世界遺産のブルーマウンテンにも日帰りで行ける距離で大都会の中でも自然を味わえます。",
                  image: Rails.root.join("db/fixtures/photos/sydney.jpg").open 
    },
  { id: 5, 
    name: "Melbourne", 
    state: 20,
    introduction: "メルボルンはヨーロッパ調の建物が多く歴史的な趣のある街です。
                  そしてなによりもメルボルンといえばカフェ！
                  どこを見てもカフェがあり、コーヒーに困ることはありません。
                  そのため海外カフェ文化を学びに来る学生も多く、セミナーや専門コースが多数開講されています。
                  海岸線をドライブできるグレートオーシャンロードや、野生ペンギンの行進がみれるフィリップ島などアクティビティも欠かせません。",
                  image: Rails.root.join("db/fixtures/photos/melbourne.jpg").open 
    },
  { id: 6, 
    name: "Brisbane", 
    state: 30,
    introduction: "ブリスベンは、消して大都会というわけではないですが高層ビルが立ち並ぶ近代的な街です。
                  学校が多いため、ワーキングホリデーや語学留学での渡航者は最初に語学学校へ通うためまずはブリスベンに、というケースも珍しくありません。
                  ちなみに写真はブリスベンからフェリーに乗って行けるフレーザー島という場所で、砂で出来た島として有名な場所です。
                  とても景色が綺麗で、運が良ければくじらにも会えるかもしれません。",
                  image: Rails.root.join("db/fixtures/photos/brisbane.jpg").open
    },
  { id: 7, 
    name: "Cairns", 
    state: 30,
    introduction: "写真は有名なグレートバリアリーフ。ここに行く玄関口となってあるのがここケアンズです。
                  亜熱帯気候のため冬でも暖かく年中マリンスポーツを楽しめるリゾートにうってつけの街。
                  他にもたくさんのアクティビティで充実していることや、日本から近く直行便もあることなどから、初めてオーストラリアに来る人にとって最初に到着する街として人気があります。
                  街自体はそんなに大きくないので、大都会から離れてのんびりとした生活を送りたい人達におススメです。",
                  image: Rails.root.join("db/fixtures/photos/cairns.jpg").open
    },
  { id: 8, 
    name: "Gold Coast", 
    state: 30,
    introduction: "写真で見てわかるように、都市とビーチが隣接している街です。サーファーズパラダイスが有名で、サーフィンをしている人達が一度は行きたいと思う場所ではないでしょうか。
                  また大きなテーマパークがいくつかあり、そこへ行くためにゴールドコーストへ向かうという人も少なくないはず。
                  またゴールドコーストはカジノやクラブ、バーなどもあり、比較的夜が早いオーストラリアでも遅くまで楽しめる環境です。夜を楽しみたい人にはおススメ。
                  ブリスベンからバスや電車で気軽にこれる距離です。", 
                  image: Rails.root.join("db/fixtures/photos/goldcoast.png").open
    },
  { id: 9, 
    name: "Adelaide", 
    state: 40,
    introduction: "南オーストラリア州の州都であるアデレードはヨーロッパ調の古い建物が立ち並ぶ歴史的な雰囲気のある街で、周りに高層ビルなども少ないことからメルボルンと比べてより雰囲気を味わえる街です。
                  国際的に評価の高い大学やカレッジ、職業訓練校が多いことから留学先としてもオススメ。
                  決して有名都市というわけではないですが、住みやすい街としても評価の高いこの街は穴場かもしれません。",
                  image: Rails.root.join("db/fixtures/photos/adelaide.jpg").open
    },
  { id: 10, 
    name: "Perth", 
    state: 50,
    introduction: "西オーストラリア州の州都でオセアニア有数の世界都市です。
                  多くの主要都市が東海岸に集中しているため、西オーストラリア州と聞けばパースが思い浮かぶという人も少なくないでしょう。
                  生活に困らない便利な環境でありながら自然やフレンドリーな人や動物に囲まれて生活することができます。
                  ここでは最低時給がしっかりと守られていてお金を稼ぎやすく、観光地ではないために落ち着いた雰囲気があるということから、地に足を着けてオーストラリア生活を味わいたい人にはオススメの街です",
                  image: Rails.root.join("db/fixtures/photos/perth.jpg").open
    },
  { id: 11,
    name: "Hobart",
    state: 60,
    introduction: "オーストラリアの南東部にあるタスマニア州の州都です。
                  各主要都市から飛行機でもいけますが、車ごと乗れる大きなフェリーがメルボルンから出航しています。
                  自然が多くと歴史を感じさせる建造物が目立ちます。
                  写真に写っているのはここタスマニア島に生息する肉食動物タスマニアデビル。見た目は愛くるしいが、非常に奇妙な鳴き声を持ちこの遠吠えを聞いた人々から「あれは悪魔の声だ」と気味悪がられたことから、デビルの名を賜ったと言われています。
                  タスマニアにある動物園で姿を見ることができます。",
                  image: Rails.root.join("db/fixtures/photos/tasmania.jpg").open
  }
)
