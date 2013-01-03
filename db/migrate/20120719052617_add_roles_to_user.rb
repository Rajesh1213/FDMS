class AddRolesToUser < ActiveRecord::Migration
  def change
  	add_column :users, :superadmin, :boolean
  	add_column :users, :admin, :boolean 
  	add_column :users, :operator, :boolean
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :phone, :string
  end
end
