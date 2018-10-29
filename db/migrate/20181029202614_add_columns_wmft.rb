class AddColumnsWmft < ActiveRecord::Migration[5.2]
  def change
    add_column :wmft_form_rows, :median_time, :integer
    add_column :wmft_form_rows, :total_fas, :integer
    add_column :wmft_form_rows, :avg_strength, :integer
    add_column :wmft_form_rows, :summary, :string
  end
end
