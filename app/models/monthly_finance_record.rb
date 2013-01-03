class MonthlyFinanceRecord < ActiveRecord::Base
  attr_accessible :due_date, :monthly_finance_id,
  				  :payment_date, :user_id,
  				  :remarks, :paid_amount, 
  				  :balance_amount, :penalty

  belongs_to :monthly_finance

end
