class AddColumnsToBarthelIndex < ActiveRecord::Migration[5.2]
  def change
    add_column :barthel_form_rows, :total_score, :integer
  end
end
