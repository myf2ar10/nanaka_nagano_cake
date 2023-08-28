class AddFirstNameKanaToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :first_name_kana, :string
  end
end
