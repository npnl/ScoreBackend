class CreateWmftFormRows < ActiveRecord::Migration[5.2]
  def change
    create_table :wmft_form_rows do |t|
      t.references :subject, foreign_key: true
      t.date :date
      t.string :task
      t.string :time
      t.string :fas_score
      t.string :arm_type
      t.integer :item_no

      t.timestamps
    end
  end
end
