class AddFamilyNameKanaToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :family_name_kana, :string
  end
end
