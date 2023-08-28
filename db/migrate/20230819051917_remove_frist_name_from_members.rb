class RemoveFristNameFromMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :frist_name, :string
  end
end
