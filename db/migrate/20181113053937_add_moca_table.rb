class AddMocaTable < ActiveRecord::Migration[5.2]
  def change
    create_table :moca_form_rows do |t|
      t.references :subject, foreign_key: true
      t.references :assessment, foreign_key: true
      t.date :date
      t.integer :visuospatial_executive
      t.integer :naming
      t.integer :attention_1
      t.integer :attention_2
      t.integer :attention_3
      t.integer :language_1
      t.integer :language_2
      t.integer :abstraction
      t.integer :delayed_recall
      t.integer :orientation
      t.integer :edu_less_than_12_yrs
      t.integer :total_score
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
