class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :access_token
      t.timestamps null: false
    end
  end
end
