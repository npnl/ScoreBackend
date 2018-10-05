class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :email
      t.string :name
      t.string :group
      t.string :designation
      t.timestamps
    end
  end
end
