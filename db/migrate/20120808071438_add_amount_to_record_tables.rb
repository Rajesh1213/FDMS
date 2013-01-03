class AddAmountToRecordTables < ActiveRecord::Migration
  def change
  	add_column :daily_finance_records, :amount, :string
  	add_column :monthly_finance_records, :amount, :string
  end
end
