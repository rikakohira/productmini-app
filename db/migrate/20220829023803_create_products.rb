class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string   :name, null: false
      t.integer  :price, null: false
      t.string   :unit, null: false
      #デフォルトをfalseに設定する
      t.boolean  :availability, null: false, default: false
      t.timestamps
    end
  end
end


