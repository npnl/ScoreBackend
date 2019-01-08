class AddMalTable < ActiveRecord::Migration[5.2]
  def change
    create_table :mal_form_rows do |t|
      t.references :subject, foreign_key: true
      t.references :assessment, foreign_key: true
      t.date :date
      t.string :activity_description
      t.integer :amount_scale
      t.integer :how_well_scale
      t.integer :if_not_why
      t.string :comments
      t.datetime :deleted_at

      t.timestamps
    end
    add_column :assessments, :mal, :boolean, default: false
  end
end
