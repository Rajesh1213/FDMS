class AddFieldsToMonthlyFinance < ActiveRecord::Migration
  def change
  	add_column :monthly_finances, :processing_fee, :string
  	add_column :monthly_finances, :monthly_inst, :string
  end
end
