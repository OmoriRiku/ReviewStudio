class CreateStoreReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :store_reviews do |t|
      t.integer   :end_user_id, null: false   # ユーザーID
      t.integer   :store_id,    null: false   # 店舗ID
      t.integer   :rate,        null: false   # 評価
      t.text      :comment,     null: false   # レビュー本文
      t.timestamps
    end
  end
end
