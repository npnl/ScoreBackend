class AddAssessmentForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_reference :armtest_form_rows, :assessment, foreign_key: true
    add_reference :barthel_form_rows, :assessment, foreign_key: true
    add_reference :fma_form_rows, :assessment, foreign_key: true
    add_reference :mas_form_rows, :assessment, foreign_key: true
    add_reference :mmt_form_rows, :assessment, foreign_key: true
    add_reference :mrs_form_rows, :assessment, foreign_key: true
    add_reference :nihss_form_rows, :assessment, foreign_key: true
    add_reference :sis_form_rows, :assessment, foreign_key: true
    add_reference :wmft_form_rows, :assessment, foreign_key: true
  end
end
