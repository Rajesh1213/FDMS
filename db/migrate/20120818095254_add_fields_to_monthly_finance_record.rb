class AddFieldsToMonthlyFinanceRecord < ActiveRecord::Migration
  def change
  	add_column :monthly_finance_records, :remarks, :text
  	add_column :monthly_finance_records, :paid_amount, :string
  	add_column :monthly_finance_records, :balance_amount, :string
  	add_column :monthly_finance_records, :penalty, :string
  end
end
