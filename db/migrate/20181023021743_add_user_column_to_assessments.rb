class AddUserColumnToAssessments < ActiveRecord::Migration[5.2]
  def change
    add_reference :assessments, :user, foreign_key: true
  end
end
