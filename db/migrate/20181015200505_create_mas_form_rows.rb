class CreateMasFormRows < ActiveRecord::Migration[5.2]
  def change
    create_table :mas_form_rows do |t|
      t.references :subject, foreign_key: true
      t.date :date
      t.string :muscle_name
      t.integer :score

      t.timestamps
    end
  end
end
