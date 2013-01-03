class AddFieldsToRents < ActiveRecord::Migration
  def change
  	add_column :rents, :tenant_name, :string
  	add_column :rents, :email_id, :string
  	add_column :rents, :previous_residing_address, :text
  	add_column :rents, :permanent_address, :text
  	add_column :rents, :rent_per_month, :string
  	add_column :rents, :advance_taken, :string
  	add_column :rents, :rent_increase_after_ced, :string
  	add_column :rents, :reference, :string
  end
end