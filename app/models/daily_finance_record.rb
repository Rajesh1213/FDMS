class DailyFinanceRecord < ActiveRecord::Base
  attr_accessible :cash_recieved_by, :daily_finance_id, :due_date, :payment_date,
  				  :user_id,:remarks, :paid_amount, :balance_amount, :penalty

  belongs_to :daily_finance


end
