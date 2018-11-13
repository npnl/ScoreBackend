class AddMocaToAssessments < ActiveRecord::Migration[5.2]
  def change
    add_column :assessments, :moca, :boolean, default: false
  end
end
