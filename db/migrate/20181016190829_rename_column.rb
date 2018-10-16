class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :armtest_form_rows, :type, :arm_type
  end
end
