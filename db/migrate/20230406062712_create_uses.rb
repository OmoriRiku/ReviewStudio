class CreateUses < ActiveRecord::Migration[6.1]
  def change
    create_table :uses do |t|
      t.integer :end_user_id,   null: false   # ユーザーid
      t.string  :name,          null: false   # 用途名
      t.timestamps
    end
  end
end
