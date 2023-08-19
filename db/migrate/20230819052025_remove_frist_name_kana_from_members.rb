class RemoveFristNameKanaFromMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :frist_name_kana, :string
  end
end
