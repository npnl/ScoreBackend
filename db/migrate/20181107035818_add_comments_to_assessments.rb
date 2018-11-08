class AddCommentsToAssessments < ActiveRecord::Migration[5.2]
  def change
    add_column :assessments, :comments, :string
  end
end
