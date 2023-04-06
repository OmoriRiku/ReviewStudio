class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string  :name,              null: false   # 店舗名
      t.text    :introduction,      null: false   # 店舗説明分
      t.string  :telephone_number,  null: false   # 店舗電話番号
      t.timestamps
    end
  end
end
