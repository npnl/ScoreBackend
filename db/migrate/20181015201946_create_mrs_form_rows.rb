class CreateMrsFormRows < ActiveRecord::Migration[5.2]
  def change
    create_table :mrs_form_rows do |t|
      t.references :subject, foreign_key: true
      t.date :date
      t.string :score

      t.timestamps
    end
  end
end
