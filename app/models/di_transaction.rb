class DiTransaction < ActiveRecord::Base
  attr_accessible :balance, :closing_balance, :credit, 
  				  :dailyinterest_id, :debit, :monthly_f_investment_id,
  				  :opening_balance, :particulars, :tran_date, :tran_id

 belongs_to :monthly_f_investment
 belongs_to :dailyinterest
 
end
