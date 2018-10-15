class CreateBarthelFormRows < ActiveRecord::Migration[5.2]
  def change
    create_table :barthel_form_rows do |t|
      t.references :subject, foreign_key: true
      t.date :date
      t.string :activity
      t.string :score
      t.string :description
      t.timestamps
    end
  end
end
