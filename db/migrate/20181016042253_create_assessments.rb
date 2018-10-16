class CreateAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :assessments do |t|
      t.references :subject, foreign_key: true
      t.date
      t.boolean :nihss
      t.boolean :fma
      t.boolean :wmft
      t.boolean :sis
      t.boolean :mrs
      t.boolean :mas
      t.boolean :mmt
      t.boolean :barthel
      t.boolean :arm
    end
  end
end