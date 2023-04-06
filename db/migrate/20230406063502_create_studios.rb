class CreateStudios < ActiveRecord::Migration[6.1]
  def change
    create_table :studios do |t|
      t.integer :use_id,          null: false   # 用途ID
      t.integer :store_id,        null: false   # 店舗ID
      t.string  :name,            null: false   # スタジオ名
      t.text    :introduction,    null: false   # スタジオの説明
      t.integer :personal_price,  null: false   # 個人料金
      t.integer :three_price,     null: false   # 3名料金
      t.integer :more_price,      null: false   # 4名以上の料金
      t.timestamps
    end
  end
end
