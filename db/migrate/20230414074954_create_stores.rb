class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string  :name,              null: false
      t.text    :introduction,      null: false
      t.string  :telephone_number,  null: false
      t.string  :post_code,         null: false
      t.string  :address,           null: false
      t.timestamps
    end
  end
end
