class CreateFmaFormRows < ActiveRecord::Migration[5.2]
  def change
    create_table :fma_form_rows do |t|
      t.references :subject, foreign_key: true
      t.date :date
      t.string :category
      t.string :posture
      t.string :movement
      t.string :extremity
      t.integer :score
      t.integer :item_no

      t.timestamps
    end
  end
end
