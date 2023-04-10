class CreateStudioReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :studio_reviews do |t|
      t.integer   :end_user_id,   null: false # ユーザーID
      t.integer   :studio_id,     null: false # スタジオID
      t.integer   :use_id,        null: false # 用途ID
      t.integer   :rate,          null: false # 評価
      t.string    :number_studio              # スタジオ利用人数
      t.text      :comment,       null: false # スタジオレビュー本文
      t.timestamps
    end
  end
end
