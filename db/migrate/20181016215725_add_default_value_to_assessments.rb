class AddDefaultValueToAssessments < ActiveRecord::Migration[5.2]
  def change
    change_column :assessments, :nihss, :boolean, default: false
    change_column :assessments, :fma, :boolean, default: false
    change_column :assessments, :wmft, :boolean, default: false
    change_column :assessments, :sis, :boolean, default: false
    change_column :assessments, :mrs, :boolean, default: false
    change_column :assessments, :mas, :boolean, default: false
    change_column :assessments, :mmt, :boolean, default: false
    change_column :assessments, :barthel, :boolean, default: false
    change_column :assessments, :arm, :boolean, default: false
  end
end
