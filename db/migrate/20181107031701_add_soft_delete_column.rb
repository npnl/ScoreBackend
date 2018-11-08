class AddSoftDeleteColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :deleted_at, :timestamp
    add_column :sessions, :deleted_at, :timestamp
    add_column :subjects, :deleted_at, :timestamp
    add_column :users, :deleted_at, :timestamp
    add_column :assessments, :deleted_at, :timestamp
    add_column :armtest_form_rows, :deleted_at, :timestamp
    add_column :barthel_form_rows, :deleted_at, :timestamp
    add_column :fma_form_rows, :deleted_at, :timestamp
    add_column :mas_form_rows, :deleted_at, :timestamp
    add_column :mmt_form_rows, :deleted_at, :timestamp
    add_column :mrs_form_rows, :deleted_at, :timestamp
    add_column :nihss_form_rows, :deleted_at, :timestamp
    add_column :sis_form_rows, :deleted_at, :timestamp
    add_column :wmft_form_rows, :deleted_at, :timestamp
  end
end
