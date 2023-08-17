class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer  :member_id,    null: false
      t.string   :post_code,    null: false
      t.text     :address,      null: false
      t.string   :name,         null: false
      t.integer  :shipping_fee, null: false
      t.integer  :total_price,  null: false
      t.integer  :pay_method,   null: false
      t.string   :status,       null: false

      t.timestamps
    end
  end
end
