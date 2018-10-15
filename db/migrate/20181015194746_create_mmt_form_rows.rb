class CreateMmtFormRows < ActiveRecord::Migration[5.2]
  def change
    create_table :mmt_form_rows do |t|
      t.references :subject, foreign_key: true
      t.date :date
      t.string :muscle_name
      t.integer :mmt_score
      t.integer :rom_score

      t.timestamps
    end
  end
end
