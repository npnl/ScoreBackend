class CreateSisFormRows < ActiveRecord::Migration[5.2]
  def change
    create_table :sis_form_rows do |t|
      t.references :subject, foreign_key: true
      t.date :date
      t.string :question_id
      t.string :selected_option

      t.timestamps
    end
  end
end
