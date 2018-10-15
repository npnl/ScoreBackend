class CreateArmtestFormRows < ActiveRecord::Migration[5.2]
  def change
    create_table :armtest_form_rows do |t|
      t.references :subject, foreign_key: true
      t.date :date
      t.string :type
      t.string :activity
      t.string :score

      t.timestamps
    end
  end
end
