class AddColumnsNihss < ActiveRecord::Migration[5.2]
  def change
    add_column :nihss_form_rows, :loc_total, :integer
    add_column :nihss_form_rows, :motor_total, :integer
    add_column :nihss_form_rows, :nhss_total, :integer
    add_column :nihss_form_rows, :comment, :string
  end
end
