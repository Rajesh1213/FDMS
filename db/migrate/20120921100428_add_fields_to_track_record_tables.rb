class AddFieldsToTrackRecordTables < ActiveRecord::Migration
  def change
  	# add_columns to daily_finances track record
    #add_column :daily_finance_records, :user_id, :integer
  	add_column :daily_finance_records, :remarks, :text
  	add_column :daily_finance_records, :paid_amount, :string
  	add_column :daily_finance_records, :balance_amount, :string
  	add_column :daily_finance_records, :penalty, :string

  	#add coloumns to monthly_interests track record
    #add_column :daily_interest_loan_records, :user_id, :integer
  	add_column :daily_interest_loan_records, :remarks, :text
  	add_column :daily_interest_loan_records, :paid_amount, :string
  	add_column :daily_interest_loan_records, :balance_amount, :string
  	add_column :daily_interest_loan_records, :penalty, :string

  	#add coloumns to monthly_interests track record
    #add_column :monthly_interest_records, :user_id, :integer
  	add_column :monthly_interest_records, :remarks, :text
  	add_column :monthly_interest_records, :paid_amount, :string
  	add_column :monthly_interest_records, :balance_amount, :string
  	add_column :monthly_interest_records, :penalty, :string
  end

end
