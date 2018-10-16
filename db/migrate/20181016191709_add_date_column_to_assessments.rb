class AddDateColumnToAssessments < ActiveRecord::Migration[5.2]
  def change
    add_column :assessments, :date, :string
  end
end
