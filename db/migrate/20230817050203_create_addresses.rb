class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      
      t.integer  :member_id,  null: false
      t.string   :post_code,  null: false
      t.text     :address,    null: false
      t.string   :name,       null: false

      t.timestamps
    end
  end
end