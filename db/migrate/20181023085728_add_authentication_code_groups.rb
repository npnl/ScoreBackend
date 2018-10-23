class AddAuthenticationCodeGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :authentication_code, :string
  end
end
