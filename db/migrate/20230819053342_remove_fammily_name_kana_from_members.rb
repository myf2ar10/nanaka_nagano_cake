class RemoveFammilyNameKanaFromMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :fammily_name_kana, :string
  end
end
