class AddColumnsToFma < ActiveRecord::Migration[5.2]
  def change
    add_column :fma_form_rows, :comment, :string
    add_column :fma_form_rows, :fma_ue_total, :integer
    add_column :fma_form_rows, :fma_le_total, :integer
    add_column :fma_form_rows, :fma_sense_total, :integer
    add_column :fma_form_rows, :fma_total, :integer
  end
end
