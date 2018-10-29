class RenameColumnInNihss < ActiveRecord::Migration[5.2]
  def change
    rename_column :nihss_form_rows, :nhss_total, :nihss_total
  end
end
