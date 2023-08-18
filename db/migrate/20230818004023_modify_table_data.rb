class ModifyTableData < ActiveRecord::Migration[6.1]
  def change
    change_column :members, :is_deleted, :boolean, default: false, null: false
    change_column :orders, :status, :integer, null: false
  end
end
