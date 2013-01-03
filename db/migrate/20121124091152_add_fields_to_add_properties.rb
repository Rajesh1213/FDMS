class AddFieldsToAddProperties < ActiveRecord::Migration
  def change
  	add_column :rents, :add_property_id, :integer
  end
end
