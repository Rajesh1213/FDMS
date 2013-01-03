class AddFieldsToTransaction < ActiveRecord::Migration
  def change
  	add_column :transactions, :monthly_finance_id, :integer
  	add_column :transactions, :daily_finance_id, :integer
  	add_column :transactions, :monthly_interest_id, :integer
  	add_column :transactions, :dailyinterest_id, :integer
  end
end
