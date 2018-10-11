class CreateNihssFormRows < ActiveRecord::Migration[5.2]
  def change
    create_table :nihss_form_rows do |t|
      t.references :subject, foreign_key: true
      t.date :date
      t.string :domain
      t.string :specific
      t.integer :fas_score
      t.integer :item_no

      t.timestamps
    end
  end
end
