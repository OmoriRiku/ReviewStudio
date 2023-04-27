# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


## 環境変数で管理者のメールアドレスとパスワードを登録する
#  メールアドレス、パスワードをGitHubへ公開しないようにするため
Admin.create!(
  [
    {
      email: ENV['ADMIN_EMAIL'],
      password: ENV['ADMIN_KEY'],
    }
  ]
)

users = EndUser.create!(
  [
    {
      name: 'aki',
      email: 'aki@example.com',
      password: 'password',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image1.jpg"), filename:"sample-post1.jpg"),
    },
    {
      name: 'jon',
      email: 'jon@example.com',
      password: 'password',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image2.jpg"), filename:"sample-post2.jpg"),
    },
    {
      name: 'たいち',
      email: 'taichi@example.com',
      password: 'password',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image3.jpg"), filename:"sample-post3.jpg"),
    },
    {
      name: 'まっち',
      email: 'macchi@example.com',
      password: 'password',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image4.jpg"), filename:"sample-post4.jpg"),
    },
    {
      name: 'Mi',
      email: 'mi@example.com',
      password: 'password',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image5.jpg"), filename:"sample-post5.jpg"),
    },
  ]
)

uses = Use.create!(
  [
    { name: '個人練習' },
    { name: 'バンド練習' },
    { name: 'リハーサル' },
    { name: 'ダンス' },
    { name: 'プリプロ' },
  ]
)

stores = Store.create!(
  [
    {
      name: 'Music Store',
      introduction: 'スタジオが全て分離しており、隣の音が入ってきづらくなっています。広々としたロビーがあり、練習後のミーティングでも活用していただけます。店舗内ではコーヒーの販売もしており大変好評をいただいております。また、無料で貸し出しているミーティングルームも別にありますので、スタッフまでお気軽にお問い合わせください。',
      telephone_number: '08012341234',
      post_code: '123-4567',
      address: '福岡県福岡市東区箱崎0-0',
      store_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image1.jpg"), filename:"sample-post1.jpg"),
    },
    {
      name: 'Nice Beam Store',
      introduction: '福岡県内で最も多くのスタジオ数を誇っています。貸し出し用のレンタル品も豊富に備えており、現役のバンドマンがかず多く練習に訪れます。横の広がりを作りたい方はぜひお越しください。',
      telephone_number: '08012341234',
      post_code: '123-4567',
      address: '福岡県福岡市東区多の津0-0',
      store_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image6.jpg"), filename:"sample-post6.jpg"),
    }
  ]
)

studios = Studio.create!(
  [
    {
      use_id: uses[2].id,
      store_id: stores[0].id,
      name: 'A studio',
      introduction: '15~20人以上入れる広さを確保しており、ライブ前のパフォーマンスの確認や、バンドメンバー同士で息を合わせるのにぴったりなお部屋になっています。また、全面鏡張りのお部屋になっているため、ご自身のフォームチェックやバンドメンバーでの練習に最適です。広々としたスタジオになっていますので、吹奏楽やラテンバンドの方でもご利用いただけます。',
      personal_price: '700',
      three_price: '1800',
      more_price: '2400',
      studio_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image4.jpg"), filename:"sample-post2.jpg"),
    },
    {
      use_id: uses[1].id,
      store_id: stores[0].id,
      name: 'B studio',
      introduction: 'こちらは4~5人ほどで入るとちょうどいい広さのスタジオになっています。バンドメンバー間での日々の練習にご活用ください。こちらのスタジオも全面鏡張りのスタジオになっていますので、フォームチェックやパフォーマンスの確認も行えます。',
      personal_price: '610',
      three_price: '1530',
      more_price: '2040',
      studio_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image3.jpg"), filename:"sample-post3.jpg"),
    },
    {
      use_id: uses[1].id,
      store_id: stores[0].id,
      name: 'C studio',
      introduction: 'こちらもB studio同様に4~5人ほどで入るとちょうどいい広さのスタジオになっています。バンドメンバー間での日々の練習にご活用ください。こちらのスタジオも全面鏡張りのスタジオになっていますので、フォームチェックやパフォーマンスの確認でご活用ください。',
      personal_price: '610',
      three_price: '1530',
      more_price: '2040',
      studio_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image3.jpg"), filename:"sample-post3.jpg"),
    },
    {
      use_id: uses[3].id,
      store_id: stores[0].id,
      name: 'ダンススタジオ',
      introduction: 'こちらはダンス専用のスタジオになっています。全面鏡張りのお部屋と、音響設備を兼ね備えているため、ダンスをされたい方にぴったりのお部屋になっています。',
      personal_price: '500',
      three_price: '1200',
      more_price: '1600',
      studio_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image7.jpg"), filename:"sample-post7.jpg"),
    },
    {
      use_id: uses[4].id,
      store_id: stores[0].id,
      name: 'レコーディングスタジオ',
      introduction: 'こちらはレコーディング専用のスタジオになっています。本格的なレコーディングを行う前のプリプロにご活用ください。また、ミックスなどもご要望があれば承ります。',
      personal_price: '10000',
      three_price: '10000',
      more_price: '10000',
      studio_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image1.jpg"), filename:"sample-post1.jpg"),
    },
    {
      use_id: uses[0].id,
      store_id: stores[1].id,
      name: 'A studio',
      introduction: '人数が１〜２人用のスタジオになっています。ドラムセットはカノープスのセットになっており、個人でドラムを練習される方にぴったりです。台座が置いてあるため、音を鳴らしながらの練習も行えます。',
      personal_price: '500',
      three_price: '1500',
      more_price: '2000',
      studio_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image1.jpg"), filename:"sample-post1.jpg"),
    },
    {
      use_id: uses[1].id,
      store_id: stores[1].id,
      name: 'B studio',
      introduction: '約6~7人ほど入れる広さのスタジオになっています。普段のバンド練習で使われる方が多いです。音響設備もしっかりしています。',
      personal_price: '600',
      three_price: '1500',
      more_price: '2000',
      studio_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image2.jpg"), filename:"sample-post2.jpg"),
    },
    {
      use_id: uses[1].id,
      store_id: stores[1].id,
      name: 'C studio',
      introduction: 'こちらもB studio同様の設備を持ったお部屋になります。普段のバンド練習で使われる方が多いです。音響設備もしっかりしています。',
      personal_price: '600',
      three_price: '1500',
      more_price: '2000',
      studio_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image3.jpg"), filename:"sample-post3.jpg"),
    },
    {
      use_id: uses[1].id,
      store_id: stores[1].id,
      name: 'D studio',
      introduction: '約6~7人ほど入れる広さのスタジオになっています。普段のバンド練習で使われる方が多いです。音響設備もしっかりしています。',
      personal_price: '620',
      three_price: '1560',
      more_price: '2080',
      studio_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-image4.jpg"), filename:"sample-post4.jpg"),
    }
  ]
)

StoreReview.create!(
  [
    {
      end_user_id: users[0].id,
      store_id: stores[0].id,
      rate: '4',
      comment: 'いつも利用しているものです。コーヒーがとても美味しいです。おすすめです。'
    },
    {
      end_user_id: users[1].id,
      store_id: stores[0].id,
      rate: '5',
      comment: 'いつも利用している無料貸し出しの機材を事前に用意していただいています。スタッフの方も気さくな方が多いです！',
    },
    {
      end_user_id: users[2].id,
      store_id: stores[0].id,
      rate: '3',
      comment: 'あまりライブハウスに訪れるミュージシャンがいるという印象はうけなかったです。どちらかと言えば趣味でやっている方が多いです。スタッフの方はいい人でした。'
    },
    {
      end_user_id: users[3].id,
      store_id: stores[0].id,
      rate: '4',
      comment: 'お客さんと仲良くしました。スタッフの方と一緒にゲームすることができます。ありがとうございました。'
    },
    {
      end_user_id: users[4].id,
      store_id: stores[0].id,
      rate: '5',
      comment: 'ダンススタジオがある数少ないお店です。いつも重宝しています。ありがとうございます。'
    },
    {
      end_user_id: users[0].id,
      store_id: stores[1].id,
      rate: '4',
      comment: '普段利用しているお店です。現役の方が多く、横のつながりを広げやすいイメージでした。'
    },
    {
      end_user_id: users[1].id,
      store_id: stores[1].id,
      rate: '3',
      comment: '大人数で入れるお部屋があまりなかった印象を受けました。'
    },
    {
      end_user_id: users[2].id,
      store_id: stores[1].id,
      rate: '5',
      comment: 'ロビーが４〜５人ごとのソファーで分けられています。机もあり、ミーティングなども行えます。'
    },
  ]
)
StudioReview.create!(
  [
    {
      end_user_id: users[0].id,
      studio_id: studios[0].id,
      rate: '5',
      number_studio: '4',
      comment: 'ライブ前の最終確認で使わせていただけました。ステージもありライブに近い状態でリハーサルできます。',
    },
    {
      end_user_id: users[1].id,
      studio_id: studios[0].id,
      rate: '4',
      number_studio: '10',
      comment: '広さがあるのでラテンバンドで使用しています。人数は窮屈しないです。'
    },
    {
      end_user_id: users[2].id,
      studio_id: studios[0].id,
      rate: '3',
      number_studio: '1',
      comment: 'スタジオ常備のドラムセットに興味があったため使用しました。個人で使うには広すぎました。'
    },
    {
      end_user_id: users[3].id,
      studio_id: studios[0].id,
      rate: '5',
      number_studio: '4',
      comment: '鏡がいいです。ありがとうございました。'
    },
    {
      end_user_id: users[0].id,
      studio_id: studios[1].id,
      rate: '5',
      number_studio: '4',
      comment: '普段使いで使用しています。',
    },
    {
      end_user_id: users[1].id,
      studio_id: studios[1].id,
      rate: '4',
      number_studio: '1',
      comment: 'YAMAHAのドラムがいい音出してます。チューニングをしっかりされていました。'
    },
    {
      end_user_id: users[2].id,
      studio_id: studios[1].id,
      rate: '4',
      number_studio: '2',
      comment: 'アコースティックのペアで入りました。使いやすかったです。'
    },
    {
      end_user_id: users[3].id,
      studio_id: studios[1].id,
      rate: '5',
      number_studio: '4',
      comment: '家から近いのでよく使用しています。',
    },
    {
      end_user_id: users[0].id,
      studio_id: studios[2].id,
      rate: '4',
      number_studio: '4',
      comment: 'B studioが入れない時に使用しています。',
    },
    {
      end_user_id: users[1].id,
      studio_id: studios[2].id,
      rate: '3',
      number_studio: '1',
      comment: 'アンプが少し調子が悪いみたいで時間をとってしまいました。'
    },
    {
      end_user_id: users[2].id,
      studio_id: studios[2].id,
      rate: '5',
      number_studio: '4',
      comment: '音の吸収がかなりいいです。余計な倍音が残らずタイトな練習に最適です。'
    },
    {
      end_user_id: users[4].id,
      studio_id: studios[3].id,
      rate: '5',
      number_studio: '1',
      comment: '音響設備と鏡があります。他のダンス仲間にも広めたいと思いました。'
    },
    {
      end_user_id: users[0].id,
      studio_id: studios[4].id,
      rate: '4',
      number_studio: '3',
      comment: 'レコーディングで使わせていただきました。本格的なレコーディングではなく、手軽にレコーディングできることがよかったです。'
    },
    {
      end_user_id: users[2].id,
      studio_id: studios[5].id,
      rate: '5',
      number_studio: '1',
      comment: '個人練習にぴったりなスタジオでした！ありがとうございました。'
    },
    {
      end_user_id: users[0].id,
      studio_id: studios[5].id,
      rate: '4',
      number_studio: '1',
      comment: 'いつもはバンドで入りますが、個人練習で入る時はここが一番落ち着きます。'
    },
    {
      end_user_id: users[3].id,
      studio_id: studios[6].id,
      rate: '3',
      number_studio: '4',
      comment: '普通でした。ありがとうございました。'
    },
    {
      end_user_id: users[0].id,
      studio_id: studios[6].id,
      rate: '4',
      number_studio: '4',
      comment: 'いつも利用しているものです。バンドメンバーとの普段の練習にぴったりな印象でした。'
    },
    {
      end_user_id: users[2].id,
      studio_id: studios[6].id,
      rate: '3',
      number_studio: '1',
      comment: '個人練習で使いました。少しドラム周りが狭かったです。'
    },
    {
      end_user_id: users[0].id,
      studio_id: studios[8].id,
      rate: '4',
      number_studio: '4',
      comment: 'いつも利用しているものです。バンドで使わせていただいています。'
    },
    {
      end_user_id: users[2].id,
      studio_id: studios[8].id,
      rate: '5',
      number_studio: '4',
      comment: '荒い音が出しやすいです。他の最前線で活躍されているバンドに会うことができました。'
    },
    {
      end_user_id: users[3].id,
      studio_id: studios[8].id,
      rate: '5',
      number_studio: '4',
      comment: 'ロックバンドで入りました。ありがとうございました。'
    },
    {
      end_user_id: users[4].id,
      studio_id: studios[8].id,
      rate: '2',
      number_studio: '1',
      comment: '隣のスタジオの音が入ってきて集中できなかったです。'
    },
  ]
)