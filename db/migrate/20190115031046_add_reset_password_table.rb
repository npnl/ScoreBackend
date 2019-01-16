class AddResetPasswordTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reset_passwords do |t|
      t.references :user, foreign_key: true
      t.datetime :requested_at
      t.string :reset_token

      t.timestamps
    end
  end
end
