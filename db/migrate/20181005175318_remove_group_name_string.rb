class RemoveGroupNameString < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :group
  end
end
