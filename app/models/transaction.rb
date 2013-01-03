class Transaction < ActiveRecord::Base
  attr_accessible :balance, :closing_balance, :credit, :debit, 
  				  :opening_balance, :particulars, :tran_date,
                  :monthly_finance_id, :daily_finance_id, :dailyinterest_id,
                  :dailyinterest_id
  
  belongs_to :monthly_finance
  belongs_to :monthly_f_investment
end
