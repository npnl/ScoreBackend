class RenameColumnWmft < ActiveRecord::Migration[5.2]
  def change
    rename_column :wmft_form_rows, :summary, :comment
  end
end
