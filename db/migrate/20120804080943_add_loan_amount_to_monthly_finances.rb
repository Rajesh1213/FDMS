class AddLoanAmountToMonthlyFinances < ActiveRecord::Migration
  def change
  	add_column :monthly_finances, :loan_amount, :string
  end
end
